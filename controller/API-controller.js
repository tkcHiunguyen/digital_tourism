const { connection } = require("../DB");
let gethome = async (req, res) => {
  try {
    const [row] = await connection.execute("SELECT * FROM view");
    res.status(200).json(row);
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
};
let posthome = (req, res) => {
  console.log(req.body);
};
let getViewByLink = async (req, res) => {
  try {
    let viewLink = req.params.id;
    const [view] = await connection.execute(
      "SELECT view.ID, view.longitude, view.latitude, view.link, view.image, view.parent, CASE WHEN view.video IS NULL THEN project.video ELSE view.video END AS video, project.view_name, project.description, project.represent FROM view INNER JOIN project ON view.parent = project.id WHERE view.link = ?;",
      [viewLink]
    );
    res.status(200).json(view);
  } catch (error) {
    res.status(500).json({ message: "ERROR DATA!" });
  }
};
let getPointId = async (req, res) => {
  try {
    let pointLink = req.params.id;
    const [listView] = await connection.execute(
      "SELECT * FROM point WHERE view_id= ?;",
      [pointLink]
    );
    res.status(200).json(listView);
  } catch (error) {
    res.status(500).json({ message: "ERROR DATA!" });
  }
};
let get3ModelId = async (req, res) => {
  try {
    let viewOf3DLink = req.params.id;
    const [list3D] = await connection.execute(
      "SELECT * FROM model_3d WHERE view_id= ?;",
      [viewOf3DLink]
    );
    res.status(200).json(list3D);
  } catch (error) {
    res.status(500).json({ message: "ERROR DATA!" });
  }
};
let getViewById = async (req, res) => {
  try {
    let infoView = req.params.parent;
    const [info] = await connection.execute(
      "SELECT * FROM project WHERE id= ?;",
      [infoView]
    );
    res.status(200).json(info);
  } catch (error) {
    res.status(500).json({ message: "ERROR DATA!" });
  }
};
let getViewLevel1 = async (req, res) => {
  try {
    const [listViewLevel1] = await connection.execute(
      "SELECT * FROM view WHERE level=?",
      [1]
    );
    res.status(200).json(listViewLevel1);
  } catch (error) {
    res.status(500).json({ message: error });
  }
};
let getViewLevel2 = async (req, res) => {
  let parent = req.params.parent;
  try {
    const [listViewLevel2] = await connection.execute(
      "SELECT * FROM view WHERE level=? AND parent=?",
      [2, parent]
    );
    res.status(200).json(listViewLevel2);
  } catch (error) {}
};

let getMainInfo = async (req, res) => {
  let parent = req.params.parent;
  try {
    const [mainInfo] = await connection.execute(
      "SELECT project.id, project.view_name, view.longitude,view.latitude from project left join view on project.represent = view.ID where project.id=?",
      [parent]
    );
    res.status(200).json(mainInfo);
  } catch (error) {
    res.status(500).json({ message: error });
  }
};
let getAllMainInfo = async (req, res) => {
  try {
    const [allMainInfo] = await connection.execute(
      "SELECT project.id, project.view_name, view.longitude,view.latitude,view.link from project left join view on project.represent = view.ID"
    );
    res.status(200).json(allMainInfo);
  } catch (error) {
    res.status(500).json({ message: error });
  }
};
let getChildLocation = async (req, res) => {
  let parent = req.params.parent;
  try {
    const [childLocation] = await connection.execute(
      "SELECT view.longitude, view.latitude, view.link from project right join view on project.id = view.parent where project.id=?",
      [parent]
    );
    res.status(200).json(childLocation);
  } catch (error) {
    res.status(500).json({ message: error });
  }
};
module.exports = {
  gethome,
  posthome,
  getViewByLink,
  getPointId,
  get3ModelId,
  getViewById,
  getViewLevel1,
  getViewLevel2,
  getMainInfo,
  getAllMainInfo,
  getChildLocation,
};
