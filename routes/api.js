const controller = require("../controller/API-controller");
const Express = require("express");
let apirouter = Express.Router();
const API_initWebRoute = (app) => {
    apirouter.get("/home", controller.gethome);
    apirouter.get("/view/:id", controller.getViewByLink);
    apirouter.get("/point/:id", controller.getPointId);
    apirouter.get("/3dmodel/:id", controller.get3ModelId);
    // apirouter.get("/getInfoView/:parent", controller.getViewById);
    // apirouter.get("/getViewLevel1", controller.getViewLevel1);
    // apirouter.get("/getViewLevel2/:parent", controller.getViewLevel2);
    apirouter.get("/getMainInfo/:parent", controller.getMainInfo);
    apirouter.get("/getAllMainInfo", controller.getAllMainInfo);
    apirouter.get("/getChildLocation/:parent", controller.getChildLocation);
    apirouter.get("")
    return app.use("/api/", apirouter);
};
module.exports = API_initWebRoute;
