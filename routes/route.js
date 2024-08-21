
const expressSession = require('express-session')
const Express = require('express')
const controller = require('../controller/controller')
const bcrypt = require('bcryptjs')
const multer = require('multer')
const path = require('path')
const sharp = require('sharp')

let router = Express.Router()
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/upload')
    },
    filename: function (req, file, cb) {
        // console.log(file)
        cb(null, Date.now() + path.extname(file.originalname))
    },
    fileFilter: function (req, file, res) {
        // Chỉ chấp nhận file type là png hoặc jpg
        const allowedMimeTypes = ['image/jpeg', 'image/png'];
        if (allowedMimeTypes.includes(file.mimetype)) {
            res(null, true);
        } else {
            res(new Error('Invalid file type. Only JPEG and PNG files are allowed.'), false);
        }
    }
})
var upload_img = multer({ storage: storage })

function resizeImage(req, res, next) {
    if (req.file) {
        sharp(req.file.path)
            .resize(8192, 4096)
            .toFile('public/upload/' + req.file.filename, function (err) {
                if (err) {
                    // Xử lý lỗi nếu cần
                    console.error(err);
                    return res.status(500).send('Internal Server Error');
                }
                req.resizedImagePath = 'public/upload/' + req.file.filename;

                // Tiếp tục middleware chain
                next();
            });
    } else {
        // Nếu không có tệp tin, tiếp tục middleware chain
        next();
    }
}

const initWebRoute = (app) => {
    router.get('/home', controller.gethome)
    router.get('/point1', controller.getPoint1)
    router.get('/point2', controller.getPoint2)
    router.get('/point3', controller.getPoint3)
    router.get('/point4', controller.getPoint4)
    router.get('/point5', controller.getPoint5)
    router.post('/create-scene', upload_img.single('panaroma_img'), controller.postScene)
    router.get('/view/:link', controller.getViewByLink)
    router.get('/', controller.getDemo)
    router.get('/map', controller.getMap)
    return app.use('/', router)
}
module.exports = initWebRoute