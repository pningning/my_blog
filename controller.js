//导入数据操作模块（数据库）
const conn = require('./model.js')
//导入时间处理模块
const moment = require('moment')
//导入mditor模块
const mditor = require('mditor')
const parser = new mditor.Parser()


//首页
var showIndexPage = (req, res) => {
    //1.获取所有文章数据，渲染到页面上
    let list= [] //用来存文章数据
    //获取当前的页面值
    const nowPage = parseInt(req.query.page) || 1
    //没一个也得条数
    const pageSize = 2


    //order by id desc 降序排序
    const sqlStr = `select articles.*,blog.nickname 
    from articles LEFT JOIN blog 
    on articles.authorId=blog.id
    order by id desc
    LIMIT ${(nowPage - 1) * pageSize}, ${pageSize};
    select count(1) as totalcount from articles;`

    conn.query(sqlStr, (err, results) => {
        if(err) return res.json({err_code: 1, message: '数据异常，稍后再试'})
        list = results[0]
        const totalcount = results[1][0].totalcount
        res.render('index', {
            islogin: req.session.islogin,
            user: req.session.user,
            list,
            totalPage: Math.ceil(totalcount / pageSize),
            nowPage
        })
    })
    
}

//展示注册页面
var showRegPage =  (req, res) => {
    res.render('./user/register', {})
}

//注册新用户
var regNewUser = (req, res) => {
    //接受到用户提交过来的信息，判断是否填写完整
    if (req.body.username.length <= 0 || req.body.password.length <= 0 || req.body.nickname.length <= 0) {
        return res.json({ err_code: 1, message: '注册失败，请填写完整的表单' })
    }
    //查询数据库是否被占用
    conn.query('select count(*) as count from blog where username=?', req.body.username, (err, results) => {
        if (err) return res.json({ err_code: 1, message: '注册失败' })
        console.log(results)
        if (results[0].count !== 0) return res.json({ err_code: 1, message: '此用户名已存在，请重新输入' })
        //没有被占用，插入数据库
        conn.query('insert into blog set ?', req.body, (err, results) => {
            if (err) return res.json({ err_code: 1, message: '注册用户失败' })
            console.log(results)
            if(results.affectedRows !== 1) return res.json({err_code: 1, message: '注册用户失败'})
            res.json({ err_code: 0, message: '注册成功' })
        })
    })

}

//获取登录页面
var showLoginPage = (req, res) => {
    res.render('./user/login.ejs', {})
}

//登录
var login = (req, res) => {
    //得到提交过来的数据，
    const user = req.body
    //执行sql语句判断用户是存在
    const sqlStr = 'select * from blog where username=? and password= ?'
    conn.query(sqlStr, [user.username, user.password], (err, results) => {
        if(err) return res.json({err_code: 1, message: '登录失败'})
        if(results.length !== 1) return res.json({err_code: 1, message: '登录失败'})
        //把登录状态的布尔值，存到session上
        req.session.islogin = true
        //把用户登录的信息对象，也挂载到session上
        req.session.user = results[0]
        //登录成功
        res.json({err_code: 0, message: '登录成功'})
    })
}

//注销登录
var logout = (req, res) => {
    req.session.destroy(function(err) {
        res.redirect('/login')
    })
}

//添加文章页面
var showAddArticlePage = (req, res) =>{
    if(!req.session.islogin) return res.redirect('/login')
    res.render('./article/add.ejs', {
        islogin: req.session.islogin,
        user: req.session.user
    })
}
//添加文章
var addNewArticle = (req, res) => {
    const article = req.body
    //补全发表时间
    article.ctime = moment().format('YYYY-MM-DD HH:mm:ss')
    //把表单提交到数据库
    const sqlStr = 'insert into articles set ?'
    conn.query(sqlStr, article, (err, results) => {
        if(err || results.affectedRows !==1 ) return res.json({err_code: 1, message: '发表文章失败'})
        // res.json({err_code: 0, message: '发表文章成功', id: results.isertId})
        res.json({ err_code: 0, message: '发表文章成功，可以跳转到文章详情页面去查看！', id: results.insertId })
    })
}

//编辑文章页面
var showArticleInfoPage = (req, res) => {
    //拿到地址栏中的id req.query的到的是？后面的参数的一个对象
    const id = req.query.id
    //定义一个空对象，用来返回文章的内容
    let articleInfo = {}
    //执行sql语句
    const sqlStr = 'select * from articles where id=?'
    conn.query(sqlStr, id, (err, results) => {
        //如果results的长度等于1，那么说明拿到了数据，把结果赋值给定义的空对象
        if(results.length === 1) {
            articleInfo = results[0]
            //在渲染页面之前，把md的文本转化成html格式
            articleInfo.content = parser.parse(articleInfo.content || '')


            res.render('./article/info', {
                islogin: req.session.islogin,
                user: req.session.user,
                articleInfo: articleInfo
            })
        }
        // console.log(results)
    })
}

// //获取编辑文章页面
var showEditAriticlePage = (req, res) => {
    //判断用户是否登录
    //1，获取参数id,
    //2.通过id查询数据库，获取到对应的文章，
    //3.把查询到的数据返回给客户端
    if(!req.session.islogin) return res.redirect('/login')
    const id = req.query.id
    const sqlStr = 'select * from articles where id= ?'
    conn.query(sqlStr, id, (err, results) => {
        if(err) return res.redirect('/')
        if(results.length !== 1) return res.redirect('/')

        //获取的对应的文章信息.如果文章作者的id不等于登录人的id直接跳转到首页
        if(results[0].authorId !== req.session.user.id) return res.redirect('/')
        console.log(results)
        //走到下面就没什么问题了把内容返回给页面
        res.render('./article/edit.ejs', {
            islogin: req.session.islogin,
            user: req.session.user,
            article: results[0]
        })
    })
}

//提交编辑页面
var editArticle = (req, res) => {
    //获取到提交信息，把提交的信息，修改到数据库
    const article = req.body
    const sqlStr = 'update articles set ? where id=?'
    conn.query(sqlStr, [article, article.id], (err, results) => {

        if(err || results.affectedRows !== 1) return res.json({err_code: 1, message:'更新失败'})
        res.json({err_code: 0, message: '更新成功'})
    })
}

module.exports = {
    showIndexPage,
    showRegPage,
    regNewUser,
    showLoginPage,
    login,
    logout,
    showAddArticlePage,
    addNewArticle,
    showArticleInfoPage,
    showEditAriticlePage,
    editArticle
}