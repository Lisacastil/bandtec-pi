const sensors = require('./sensors')
const SerialPort = require("serialport");
const Readline = SerialPort.parsers.Readline;

class ArduinoRead {

    constructor() {
        this.umidade = [];
        this.luminosidade = []; //vetor variavel que pode armazenar multiplos valores
        
    }

    get Umidade() {
        return this.umidade;
    }

    get Luminosidade() {
        return this.luminosidade;
    }



    fake_data() {
        setInterval(() => {
            let data_float = sensors.lm35(-2, 3);

            if (this.listData.length === 59) {
                let sum = this.listData.reduce((a, b) => a + b, 0);
                this.listDataHour.push((sum / this.listData.length).toFixed(2));
                while (this.listData.length > 0) {
                    this.listData.pop();
                } 
            }
            console.log('Data', data_float);
            this.listData.push(data_float);
        }, 2000);
    }


    SetConnection() {

        SerialPort.list().then(listSerialDevices => {

            let listArduinoSerial = listSerialDevices.filter(serialDevice => {
                return serialDevice.vendorId == 2341 && serialDevice.productId == 43;
            });

            if (listArduinoSerial.length != 1) {
                this.fake_data();
                console.log("Arduino not found - Generating data");
            } else {
                console.log("Arduino found in the com %s", listArduinoSerial[0].comName);
                return listArduinoSerial[0].comName;
            }
        }).then(comName => {
            try {
                let arduino = new SerialPort(comName, { baudRate: 9600 });

                const parser = new Readline();
                arduino.pipe(parser);
                arduino.on('close',() => {
                    console.log('Lost Connection');
                    this.fake_data();
                });
                parser.on('data', (data) => {
                    console.log('data', data);
                    let split = data.split(' ')

                    let ax_luminosidade = split[0]
                    this.luminosidade.push(parseFloat(ax_luminosidade));

                    let ax_umidade = split[1]
                    this.umidade.push(parseFloat(ax_umidade));
                });
            } catch (e) {
                this.fake_data();
            }

        }).catch(error => console.log(error));
    }
}

const serial = new ArduinoRead();
serial.SetConnection();

module.exports.ArduinoDataTemp = { umidade: serial.Umidade, luminosidade: serial.Luminosidade}