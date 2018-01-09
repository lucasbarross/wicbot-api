var express     = require("express"),
    bodyParser  = require("body-parser"),
    mongoose    = require("mongoose"),
    config      = require("./config")
    app         = express();

mongoose.Promise = Promise;
mongoose.connect(config.mongo.url, { useMongoClient: true }).catch((err) => console.log(err));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.listen(process.env.PORT || 3000, function(){
    console.log("Connected");
});