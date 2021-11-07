const express = require('express');
const { ArduinoDataTemp } = require('./newserial')
const router = express.Router();


router.get('/', (request, response, next) => {

    let somaumi = ArduinoDataTemp.umidade.reduce((a, b) => a + b, 0);
    let media_umi = (somaumi / ArduinoDataTemp.umidade.length).toFixed(2); //soma dividida pela quantidade de itens da lista
    let somalumi = ArduinoDataTemp.luminosidade.reduce((a, b) => a + b, 0);
    let media_lumi = (somalumi / ArduinoDataTemp.luminosidade.length).toFixed(2);

    response.json({
        data_umidade: ArduinoDataTemp.umidade,
        data_luminosidade: ArduinoDataTemp.luminosidade,
        total: ArduinoDataTemp.umidade.length,
        media_umi: isNaN(media_umi) ? 0 : media_umi,
        media_lumi: isNaN(media_lumi) ? 0 : media_lumi,
    });

});

module.exports = router;