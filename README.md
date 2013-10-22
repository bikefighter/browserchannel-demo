Simple Browser Channel Demo
===========================

* `bundle install`
* Run with `bundle exec thin start`
* Navigate to `http://localhost:3000/demo`
* Page should alert.


Server Side Event Handler
-------------------------
Example given in demo_handler.rb.
Use when initializing BrowserChannel::Server
    `BrowserChannel::Server.new({handler: DemoHandler})`


Recompile the Browser Channel JS
--------------------------------

    python ../closure-library/closure/bin/build/closurebuilder.py \
            --root=../closure-library/ --namespace='bc.newHandler' \
            --output_mode=compiled \
            --compiler_jar=../compiler-20131014/compiler.jar \
            ./public/js/browserchannel.js \
            > ./public/js/browserchannel.min.js