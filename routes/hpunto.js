

var express = require('express');
var router = express.Router();
const hpuntoController =require('../controllers/hhpuntoController')
/* GET home page. 
router.get('/', function(req, res, next) {
  res.render('/rol/index', { title: 'Express' });
});
*/ 
/*rest*/
router.get('/',hpuntoController.index);
router.get('/crear',hpuntoController.crear);
router.post('/',hpuntoController.guardar);
router.post('/eliminar/:codigo',hpuntoController.eliminar);
router.get('/editar/:codigo',hpuntoController.editar);  
router.post('/actualizar',hpuntoController.actualizar); 



module.exports = router; 
 