
var PLUGIN_NAME = 'openApp';

var openApp = function()
{
  this.open = function( data )
  {
    cordova.exec( function(){}, function(){}, PLUGIN_NAME, 'open', [] );
  };

  this.close_plugin = function()
  {
    cordova.exec( function(){}, function(){}, PLUGIN_NAME, 'close_plugin', [] );
  };
};

if( module.exports )
{
  module.exports = openApp;
}
