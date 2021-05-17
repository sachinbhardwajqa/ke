function fn() {
  // Main file for configurations, useful to execute any code before running anything
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; //Default Environment
  }
  var config = {
//    env: env,
//    myVarName: 'someValue',
    apiUrl: 'https://conduit.productionready.io/api'
  }
  if (env == 'dev') {
//     customize
//     e.g. config.foo = 'bar';
    config.userEmail = 'karate@1750.com'
    config.userPassword = 'karate123'
  } else if (env == 'e2e') {
    config.userEmail = 'karate@1750.com'
    config.userPassword = 'karate123'
  }

  var accessToken = karate.callSingle('classpath:helper/CreateToken.feature',config).authToken
  karate.configure('headers',{Authorization: 'Token '+ accessToken})
  return config;
}