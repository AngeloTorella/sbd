var express = require('express');
var router = express.Router();
const descuentoController =require('../controllers/descuentoController')
/* GET home page. 
router.get('/', function(req, res, next) {
  res.render('/rol/index', { title: 'Express' });
});
*/
/*rest*/
router.get('/',descuentoController.index);



module.exports = router; 
 