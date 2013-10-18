Simple Browser Channel Demo
===========================

* `bundle install`
* Run with `thin start`
* Navigate to `http://localhost:3000/demo`
* Page should alert.


Recompile the Browser Channel JS
--------------------------------

    python ../closure-library/closure/bin/build/closurebuilder.py \
            --root=../closure-library/ --namespace='bc.newHandler' \
            --output_mode=compiled \
            --compiler_jar=../compiler-20131014/compiler.jar \
            ./public/js/browserchannel.js \
            > ./public/js/browserchannel.min.js