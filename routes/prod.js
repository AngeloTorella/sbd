var express = require('express');
var router = express.Router();
const prodController =require('../controllers/prodController')
/* GET home page. 
router.get('/', function(req, res, next) {
  res.render('/rol/index', { title: 'Express' });
});
*/
/*rest*/
router.get('/',prodController.index);



module.exports = router; 