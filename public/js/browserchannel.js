// JS used to compile browserchannel.min.js
//
// If using this file directly, you must include closure-library/closure/goog/base.js 
//in html script tag before this file is loaded

goog.provide('bc.newHandler');
goog.require('goog.net.BrowserChannel');


bc.newHandler = function(message) {
  return new goog.net.BrowserChannel.Handler();
  
}
goog.exportSymbol('bc.newHandler', bc.newHandler);