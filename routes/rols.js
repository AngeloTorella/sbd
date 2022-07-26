var express = require('express');
var router = express.Router();
const rolsController =require('../controllers/rolsController')
/* GET home page. 
router.get('/', function(req, res, next) {
  res.render('/rol/index', { title: 'Express' });
});
*/
router.get('/',rolsController.index);
router.get('/crear',rolsController.crear);
router.post('/',rolsController.guardar);
router.post('/eliminar/:codigo',rolsController.eliminar);
router.post('/editar/:codigo',rolsController.editar);
router.post('/actualizar',rolsController.actualizar);
router.post('/ordenar',rolsController.ordenar);



module.exports = router; 
 