
const expressSession = require('express-session')
const Express = require('express')
const bcrypt = require('bcryptjs')
const multer = require('multer')
const { connection } = require("../DB")
const sharp = require('sharp')
const fs = require('fs')
global.permission = null
global.nameacc = null
global.email = null
global.role = null
global.company = null
global.dateStart = null
global.total_models = null
global.total_accs = null
global.avatar = null

let gethome = async (req, res) => {
    const [row] = await connection.execute('SELECT * FROM view where level=?;', [1])
    //const [row] = await connection.execute('SELECT * FROM view ')
    //console.log(row)
    //return res.render('admin', { data: row })
    return res.render('homepage')
}

let getDemo = (req, res) => {
    res.redirect('/home')
}
let getPoint1 = (req, res) => {
    res.render('pointview1')
}
let getPoint2 = (req, res) => {
    res.render('pointview2')
}
let getPoint3 = (req, res) => {
    res.render('pointview3')
}
let getPoint4 = (req, res) => {
    res.render('pointview4')
}
let getPoint5 = (req, res) => {
    res.render('pointview5')
}
let postScene = async (req, res) => {
    //console.log(req.body)
    try {
        const imagePath = req.file.path;
        // Sử dụng sharp để xử lý hình ảnh
        const resizedImagePath = 'public/upload/resize' + req.file.filename;
        await sharp(imagePath)
            .resize(9032, 4516)
            .toFile(resizedImagePath);

        // Tiếp tục xử lý các thông tin khác
        req.body.image = '/' + resizedImagePath.split('/').slice(1).join("/");
        let image = req.body.image;
        let name = req.body.name;
        let longitude = req.body.longitude;
        let latitude = req.body.latitude;
        let link = 'id=@(' + longitude + ',' + latitude + ')';
        let description = req.body.description;
        let level = parseInt(req.body.level);

        // Thực hiện truy vấn SQL để chèn dữ liệu vào cơ sở dữ liệu
        await connection.execute('INSERT INTO view(view_name, link, longitude, latitude, description, image,level) VALUES (?,?,?,?,?,?,?)', [name, link, longitude, latitude, description, image, level]);
        fs.unlinkSync(imagePath)
        // Chuyển hướng sau khi hoàn thành
        res.redirect('/home');
    } catch (err) {
        console.error(err);
        res.status(500).send('Internal Server Error');
    }
}
let getViewByLink = async (req, res) => {
    let viewLink = req.params.link
    const [view] = await connection.execute('SELECT * FROM view WHERE link= ?;', [viewLink])
    return res.render('view', { data: view })

}
let getImage = (req, res) => {
    res.render('image')
}
let  getMap =async (req, res) => {
    const [row] = await connection.execute('SELECT * FROM view where level=?;', [1])
    return res.render('admin', { data: row })

}
module.exports = {
    gethome,
    getDemo,
    getPoint1,
    getPoint2,
    getPoint3,
    getPoint4,
    getPoint5,
    postScene,
    getViewByLink,
    getMap,
}