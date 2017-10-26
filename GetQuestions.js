var request = require('request');
/**
  *
  * params.username     the username to query rest api
  * params.password     the password to query rest api
  * @param params
  * @returns {Promise}
  *
  */
function main(params) {
    
    var username = params.username;
    var password = params.password;
    var url = 'https://cdlsurvey.mybluemix.net/questions';
    
    //console.log('in');
    var promise = new Promise(function(resolve, reject) {
        request({
            method: 'GET',
            url: url,
            auth: {username: username, password: password},
            timeout: 30000
        }, function (error, response, body) {
            if (error) {
                console.log('error API invoking', error);
                reject({
                    error: error,
                    response: response,
                    body: body
                });
            } else {
                console.log('success API invoking', body);
                var respMsg = JSON.parse(body);
                var payload = {questions:[]};
                for (var i = 0; i < respMsg.length; i++) {
                    payload.questions.push(respMsg[i]);
                }
                resolve(payload);
            }
        });
    });
    
    return promise;
}
