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
router.get('/crear',descuentoController.crear);
router.post('/',descuentoController.guardar);
router.post('/eliminar/:codigo',descuentoController.eliminar);
router.get('/editar/:codigo',descuentoController.editar);  
router.post('/actualizar',descuentoController.actualizar); 




module.exports = router; 
 