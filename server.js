var express     = require("express"),
    bodyParser  = require("body-parser"),
    config      = require("./config")
    app         = express();
    
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.listen(process.env.PORT || 3000, function(){
    console.log("Connected");
});