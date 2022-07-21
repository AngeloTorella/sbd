var express = require('express');
var router = express.Router();
const puntoController =require('../controllers/histPuntController')
/* GET home page. 
router.get('/', function(req, res, next) {
  res.render('/rol/index', { title: 'Express' });
});
*/ 
/*rest*/
router.get('/',puntoController.index);
router.get('/crear',puntoController.crear);
router.post('/',puntoController.guardar);
router.post('/eliminar/:codigo',puntoController.eliminar);
router.get('/editar/:codigo',puntoController.editar);  
router.post('/actualizar',puntoController.actualizar); 



module.exports = router; 
 