var express = require('express');
var router = express.Router();
const presupController =require('../controllers/presupController')
/* GET home page. 
router.get('/', function(req, res, next) {
  res.render('/rol/index', { title: 'Express' });
});
*/
/*rest*/
router.get('/',presupController.index);



module.exports = router; 
 