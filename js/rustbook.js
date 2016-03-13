// Copyright 2014-2015 The Rust Project Developers. See the COPYRIGHT
// file at the top-level directory of this distribution and at
// http://rust-lang.org/COPYRIGHT.
//
// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
// option. This file may not be copied, modified, or distributed
// except according to those terms.

/*jslint browser: true, es5: true */
/*globals $: true, rootPath: true */

document.addEventListener('DOMContentLoaded', function() {
    'use strict';

    document.getElementById('toggle-nav').onclick = function(e) {
        var toc = document.getElementById('toc');
        var pagewrapper = document.getElementById('page-wrapper');
        toggleClass(toc, 'mobile-hidden');
        toggleClass(pagewrapper, 'mobile-hidden');
    };

    function toggleClass(el, className) {
        // from http://youmightnotneedjquery.com/
        if (el.classList) {
            el.classList.toggle(className);
        } else {
            var classes = el.className.split(' ');
            var existingIndex = classes.indexOf(className);

            if (existingIndex >= 0) {
                classes.splice(existingIndex, 1);
            } else {
                classes.push(className);
            }

            el.className = classes.join(' ');
        }
    }    
});
