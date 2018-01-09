var express = require("express"),
    router  = express.Router(),
    controller = require("/controllers/champions")

router.route("/")
      .get(controller.getAll)
      .post(controller.createNew);

router.route("/:id")
      .get(controller.getChampion)
      .put(controller.updateChampion)
      .delete(controller.deleteChampion);