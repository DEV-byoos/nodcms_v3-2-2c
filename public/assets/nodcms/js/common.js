/**
 * Created by Mojtaba on 5/24/2017.
 */
window.CKEDITOR_BASEPATH = $('body').attr('data-base-url')+'assets/plugins/ckeditor/';

/**
 * Static translation texts
 *
 * @param value
 * @returns {*}
 */
function translate(value){
    if(typeof SITE_TRANSLATE != "undefined" && typeof SITE_TRANSLATE[value] != "undefined")
        return SITE_TRANSLATE[value];
    return value;
}

(function ($) {

    // Save the origin jquery ajax
    let $originAjax = $.ajax;

    // Reset jquery ajax function to add csrf token generally
    $.ajax = function (url, options) {

        // If url is an object, simulate pre-1.5 signature
        if ( typeof url === "object" ) {
            options = url;
            url = undefined;
        }

        // Force options to be an object
        options = options || {};

        if((options.hasOwnProperty('method') && options.method !== null && options.method.toLowerCase() === "post") ||
            (options.hasOwnProperty('type') && options.type !== null && options.type.toLowerCase() === "post")) {
            let m = document.getElementById('csrf_meta');
            if(m !== null) {
                if(!options.hasOwnProperty('headers'))  options['headers'] = {};
                if(!options.headers.hasOwnProperty(m.getAttribute('name'))) {
                    options.headers[m.getAttribute('name')] = m.getAttribute('content');
                }
            }
        }

        return $originAjax(url, options);
    };

    $.dataListSearch = function () {
        var query_string = "?";
        $('.data-list-search-input').each(function () {
            if($("#language_select").val() != 0 && $("#language_select").val() != null){
                query_string += 'language=' + $("#language_select").val() + '&';
            }
            if($("#filters").val() != 0 && $("#filters").val() != null){
                query_string += 'filters=' + $("#filters").val() + '&';
            }
        });
        return query_string;
    };

    $.showInModal = function(title, content, addButtons,modal_class) {
        var myModal = $('<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">'+
            '<div class="modal-dialog '+modal_class+'" role="document">'+
            '<div class="modal-content">'+
            '<div class="modal-header">'+
            '<h4 class="modal-title">'+title+'</h4>'+
            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
            '</div>'+
            '<div class="modal-body">'+
            '</div>'+
            '<div class="modal-footer">'+
            '<button type="button" class="btn btn-default" data-dismiss="modal">'+ translate('Close') +'</button>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>').on('hidden.bs.modal', function (e) {
            $(this).remove();
        });
        myModal.appendTo('body');
        myModal.find('.modal-body').html(content);
        var modalFooter = myModal.find('.modal-footer');
        if(addButtons!=null && typeof addButtons == 'object' && addButtons.length>0){
            $.each(addButtons, function (key,val) {
                modalFooter.append(val);
            });
        }else if(addButtons!=null){
            modalFooter.append(addButtons);
        }
        myModal.modal('show');
        return myModal;
    };

    $.fn.quickCKeditor = function () {
        $(this).each(function () {
            var $myTextArea = $(this);
            CKEDITOR.replace($myTextArea.attr('id'), {
                on: {
                    instanceReady: function(evt) {
                        $($myTextArea.attr('data-loading')).remove();
                    }
                },
                toolbar: [
                    // TODO: Make a great simple editor
                    { name: 'document', items: [ 'Source' ] },	// Defines toolbar group with name (used to create voice label) and items in 3 subgroups.
                    [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo', 'Underline', 'Strike'],			// Defines toolbar group without name.
                    { name: 'basicstyles', items: [ 'Bold', 'Italic' ] },

                    { name: 'links', items: [ 'Link' ] },
                ]
            });
        })
    };

    $.fn.checkEditorLoad = function () {
        if(typeof CKEDITOR!=='undefined'){
            $(this).find('.ckeditor').each(function () {
                var $myTextArea = $(this);
                if (CKEDITOR.instances[$myTextArea.attr('id')]) {
                    $($myTextArea.attr('data-loading')).remove();
                    return;
                }
                CKEDITOR.replace($myTextArea.attr('id'), {
                    on: {
                        instanceReady: function(evt) {
                            $($myTextArea.attr('data-loading')).remove();
                        }
                    }
                });
            });
            $(this).find('.ckeditor-quick').quickCKeditor();
        }else if($(this).find('.ckeditor,.ckeditor-quick').length > 0){
            $(this).find('.ckeditor').each(function () {
                $(this).removeClass('ckeditor');
            });
            $(this).find('.ckeditor-quick').each(function () {
                $(this).removeClass('ckeditor-quick');
            });
            alert('common.js: Load the ckeditor.js file is required to use this form.');
        }
        return $(this);
    };

    $.loadInModal = function (url, addon_class, success_func) {
        var myModal = $('<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">'+
            '<div class="modal-dialog '+addon_class+'" role="document">'+
            '<div class="modal-content">'+
            '<div class="modal-header hidden">'+
            '<h4 class="modal-title">Modal title</h4>'+
            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
            '</div>'+
            '<div class="modal-body">'+
            '<p class="text-center"><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i></p>'+
            '</div>'+
            '<div class="modal-footer hidden">'+
            '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>').on('hidden.bs.modal', function (e) {
            $(this).remove();
        }).appendTo('body');
        myModal.modal('show');
        $.ajax({
            url: url,
            dataType: "json",
            success:function (data) {
                if(data.status == "success") {
                    if(typeof data.title !== 'undefined'){
                        myModal.find('.modal-title').html(data.title);
                    }else{
                        myModal.find('.modal-title').remove();
                    }
                    if(typeof data.content !== 'undefined'){
                        myModal.find('.modal-body').html($(data.content));
                    }else{
                        myModal.find('.modal-body').remove();
                    }
                    if(typeof data.footer !== 'undefined'){
                        myModal.find('.modal-footer').html($(data.footer));
                    }
                    if(typeof data.closeBtnLabel !== 'undefined'){
                        myModal.find('.modal-footer button[data-dismiss="modal"]').html(data.closeBtnLabel);
                    }else{
                        myModal.find('.modal-footer button[data-dismiss="modal"]').remove();
                    }
                    if(typeof data.footerLinks !== 'undefined'){
                        var default_options = {
                            color: '',
                            url: '',
                            caption: '',
                            target: '_self'
                        };
                        $.each(data.footerLinks, function (key, val) {
                            val = $.extend(default_options, val);
                            $('<a class="btn '+val.color+'" href="'+val.url+'" target="'+val.target+'">'+val.caption+'</a>').prependTo(myModal.find('.modal-footer'));
                        });
                    }
                    if(typeof data.footerButtons !== 'undefined'){
                        var default_options = {
                            color: '',
                            onclick: '',
                            caption: '',
                            target: '_self'
                        };
                        $.each(data.footerButtons, function (key, val) {
                            val = $.extend(default_options, val);
                            $('<button type="button" class="btn '+val.color+'" onclick="'+val.onclick+'">'+val.caption+'</button>').prependTo(myModal.find('.modal-footer'));
                        });
                    }
                    myModal.find('.modal-header, .modal-footer').removeClass('hidden');
                    myModal.checkEditorLoad().handleAutomatics();
                    myModal.find('.input-select2').each(function () {
                        $(this).select2({
                            allowClear: true,
                            dropdownParent: myModal,
                            width: null
                        });
                    });
                    if($.fn.makeDropzone){
                        myModal.find('.dropzone').makeDropzone();
                    }
                    // Handel auto-loading the pages
                    // TODO: Should test
                    if(myModal.find('.next-page').length > 0){
                        myModal.modalScrollEnd(function(){
                            myModal.find('.next-page').attr('class', 'next-page-loading');
                            myModal.find('.next-page-loading').loadBefore(myModal.find('.next-page-loading').attr('data-url'));
                            myModal.find('.next-page-loading').remove();
                        });
                    }
                    if(typeof success_func == 'function')
                        success_func(myModal);
                }
                else
                    myModal.find('.modal-body').html('<div class="note note-danger"><h4 class="title">Error</h4><p>'+data.error+'</p></div>');
            },
            error: function (xhr, status, error) {
                // var err = eval("(" + xhr.responseText + ")");
                console.log(xhr.responseText);
                myModal.find('.modal-body').html('<div class="note note-danger"><h4 class="title">Error</h4><p>Ajax failed: '+error+'!</p></div>');
            }
        });
        return myModal;
    };

    $.redirectTo = function (url, message) {
        var myModal = $('<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">'+
            '<div class="modal-dialog" role="document">'+
            '<div class="modal-content">'+
            '<div class="modal-body">'+
            '<p class="text-center"><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i></p>'+
            '<p class="text-center">'+ message +'</p>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>').on('hidden.bs.modal', function (e) {
            $(this).remove();
        }).appendTo('body');
        myModal.modal({backdrop: 'static', keyboard: false});
        window.location = url;
        return myModal;
    };

    $.redirectProcess = function (url, message) {
        var myModal = $('<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">'+
            '<div class="modal-dialog" role="document">'+
            '<div class="modal-content">'+
            '<div class="modal-body">'+
            '<p class="text-center"><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i></p>'+
            '<p class="text-center">'+ message +'</p>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>').on('hidden.bs.modal', function (e) {
            $(this).remove();
        }).appendTo('body');
        myModal.modal({backdrop: 'static', keyboard: false});
        $.ajax({
            url: url,
            dataType: "json",
            success:function (data) {
                if(data.status == "success") {
                    window.location = data.url;
                }
                else{
                    toastr.error(data.error, translate('error'));
                    myModal.modal('hide');
                }
            },
            error: function (xhr, status, error) {
                // var err = eval("(" + xhr.responseText + ")");
                console.log(xhr.responseText);
                toastr.error(error, translate('error'));
                // myModal.find('.modal-body').html('<div class="note note-danger"><h4 class="title">Error</h4><p>Ajax failed: '+error+'!</p></div>');
                myModal.modal('hide');
            }
        });
        return myModal;
    };

    $.loadConfirmModal = function (url, onConfirmSuccess) {
        var myModal = $('<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">'+
            '<div class="modal-dialog" role="document">'+
            '<div class="modal-content">'+
            '<div class="modal-header hidden">'+
            '<h4 class="modal-title">Modal title</h4>'+
            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
            '</div>'+
            '<div class="modal-body text-center">'+
            '<p class="text-center"><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i></p>'+
            '</div>'+
            '<div class="modal-footer hidden">'+
            '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>'+
            '<button type="button" class="btn red-soft" data-confirm="1">Yes</button>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>').on('hidden.bs.modal', function (e) {
            $(this).remove();
        }).appendTo('body');
        myModal.modal('show');
        $.ajax({
            url: url,
            dataType: "json",
            success:function (data) {
                if(data.status == "success") {
                    if(typeof data.title !== 'undefined'){
                        myModal.find('.modal-title').html(data.title);
                    }else{
                        myModal.find('.modal-title').remove();
                    }
                    if(typeof data.content !== 'undefined'){
                        myModal.find('.modal-body').html($(data.content));
                    }else{
                        myModal.find('.modal-body').remove();
                    }
                    if(typeof data.noBtnLabel !== 'undefined'){
                        myModal.find('.modal-footer button[data-dismiss="modal"]').html(data.noBtnLabel);
                    }else{
                        myModal.find('.modal-footer button[data-dismiss="modal"]').remove();
                    }
                    if(typeof data.yesBtnLabel !== 'undefined'){
                        myModal.find('.modal-footer button[data-confirm="1"]').html(data.yesBtnLabel);
                    }
                    myModal.find('.modal-header, .modal-footer').removeClass('hidden');

                    // Handel auto-loading the pages
                    // TODO: Should test
                    if(myModal.find('.next-page').length > 0){
                        myModal.modalScrollEnd(function(){
                            myModal.find('.next-page').attr('class', 'next-page-loading');
                            myModal.find('.next-page-loading').loadBefore(myModal.find('.next-page-loading').attr('data-url'));
                            myModal.find('.next-page-loading').remove();
                        });
                    }

                    if(typeof data.confirmUrl !== 'undefined'){
                        myModal.find('.modal-footer button[data-confirm="1"]').click(function () {
                            var $yesButton = $(this);
                            $.ajax({
                                url: data.confirmUrl,
                                dataType: "json",
                                beforeSend: function () {
                                    $yesButton.addClass('disabled').prepend($('<i class="fa fa-spinner fa-pulse"></i> '));
                                },
                                complete:function () {
                                    $yesButton.find('.fa.fa-spinner').remove();
                                },
                                success:function (result) {
                                    if(data.status == "success") {
                                        toastr.success(result.msg, translate('Success'));
                                        if(typeof onConfirmSuccess !== 'undefined'){
                                            onConfirmSuccess(result,myModal);
                                            return;
                                        }
                                        if(typeof data.redirect !== 'undefined' && data.redirect==1){
                                            myModal.find('.modal-body').html('<p class="text-center"><i class="fa fa-spinner fa-pulse"></i> ' +
                                                translate('Redirecting...') +
                                                '</p>');
                                            window.location = result.url;
                                            return;
                                        }
                                        if(typeof result.data !== 'undefined' && typeof result.data.success !== 'undefined'){
                                            eval(result.data.success);
                                        }
                                        myModal.modal('hide');
                                    }else{
                                        toastr.error(result.error, translate('Error'));
                                    }
                                },
                                error: function (xhr, status, error) {
                                    console.log(xhr.responseText);
                                    toastr.error(translate('Send form with ajax failed!'), translate('Error'));
                                }
                            });
                        });
                    }
                }
                else
                    myModal.find('.modal-body').html('<div class="note note-danger"><h4 class="title">Error</h4><p>'+data.error+'</p></div>');
            },
            error: function (xhr, status, error) {
                // var err = eval("(" + xhr.responseText + ")");
                console.log(xhr.responseText);
                myModal.find('.modal-body').html('<div class="note note-danger"><h4 class="title">Error</h4><p>Ajax failed: '+error+'!</p></div>');
            }
        });
        return myModal;
    };

    $.fn.modalScrollEnd = function(success_fun){
        var $modal = $(this);
        var do_active = function () {
            var modal_scrollTop = $modal.scrollTop();
            var modal_scrollHeight = $modal.prop('scrollHeight');
            var modal_innerHeight = $modal.innerHeight();
            // Write to console log to debug:
            // console.warn('modal_scrollTop: ' + modal_scrollTop);
            // console.warn('modal_innerHeight: ' + modal_innerHeight);
            // console.warn('modal_scrollHeight: ' + modal_scrollHeight);
            if (modal_scrollTop + modal_innerHeight >= (modal_scrollHeight - 100)) {
                success_fun();
            }
        };
        do_active();
        $modal.scroll(function() {
            do_active();
        });
    };

    $.fn.loadIn = function (url, empty_404) {
        var $this = $(this);
        $.ajax({
            url: url,
            dataType: "json",
            success:function (data) {
                if(data.status == "success") {
                    if(typeof data.content !== 'undefined'){
                        $this.html($(data.content));
                        var btn, $form = $this.find('form');
                        if(typeof data.footerLinks !== 'undefined'){
                            var default_options = {
                                color: '',
                                url: '',
                                caption: '',
                                target: '_self'
                            };
                            $.each(data.footerLinks, function (key, val) {
                                val = $.extend(default_options, val);
                                btn = $('<a class="btn '+val.color+'" href="'+val.url+'" target="'+val.target+'">'+val.caption+'</a>');
                                if($form.length > 0){
                                    btn.appendTo($form);
                                }else{
                                    btn.appendTo($this);
                                }
                            });
                        }
                        if(typeof data.footerButtons !== 'undefined'){
                            var default_options = {
                                color: '',
                                onclick: '',
                                caption: '',
                                target: '_self'
                            };
                            $.each(data.footerButtons, function (key, val) {
                                val = $.extend(default_options, val);
                                btn = $('<button type="button" class="btn '+val.color+'" onclick="'+val.onclick+'">'+val.caption+'</button>');
                                if($form.length > 0){
                                    btn.appendTo($form);
                                }else{
                                    btn.appendTo($this);
                                }
                            });
                        }
                        $this.checkEditorLoad().handleAutomatics();
                        $('.input-select2').each(function () {
                            $(this).select2({
                                allowClear: true,
                                width: null
                            });
                        });
                        $this.find('.plot-statistics').each(function () {
                            $(this).handelPlotStatistic();
                        });
                        $this.find('.plot-pie-statistics').each(function () {
                            $(this).handelPlotPieStatistic();
                        });
                        if($.fn.makeDropzone){
                            $this.find('.dropzone').makeDropzone();
                        }
                    }
                }
                else{
                    if(typeof empty_404 != "undefined" && empty_404){
                        console.log(data.error);
                        $this.html('');
                        return;
                    }
                    $this.html('<div class="note note-danger"><h4 class="title">'+translate('Error')+'</h4><p>'+data.error+'</p></div>');
                }
            },
            error: function (xhr, status, error) {
                // var err = eval("(" + xhr.responseText + ")");
                // alert(xhr.responseText);
                if(typeof empty_404 != "undefined" && empty_404){
                    alert(error);
                    alert(status);
                    $this.html('');
                    return;
                }
                $this.html('<div class="note note-danger"><h4 class="title">Error</h4><p>Ajax failed: '+error+'!</p><div>'+xhr.responseText+'</div></div>');
            }
        });
    };

    $.fn.loadBefore = function (url, success_fun) {
        var $this = $(this);
        $.ajax({
            url: url,
            dataType: "json",
            success:function (data) {
                if(data.status == "success") {
                    if(typeof data.content !== 'undefined'){
                        $this.insertBefore($(data.content));
                        $this.checkEditorLoad().handleAutomatics();
                        $('.input-select2').each(function () {
                            $(this).select2({
                                allowClear: true,
                                width: null
                            });
                        });
                    }
                }
                else
                    $this.html('<div class="note note-danger"><h4 class="title">Error</h4><p>'+data.error+'</p></div>');
            },
            error: function (xhr, status, error) {
                // var err = eval("(" + xhr.responseText + ")");
                // alert(xhr.responseText);
                $this.html('<div class="note note-danger"><h4 class="title">Error</h4><p>Ajax failed: '+error+'!</p><div>'+xhr.responseText+'</div></div>');
            }
        });
    };

    $.fn.makeSpinnerBtn = function(){
        $(this).click(function () {
            $(this).addClass('disabled').append('<i class="fa fa-spinner fa-pulse"></i>')
        });
    };

    $.fn.removeAnItemFromList = function (url, type) {
        var the_element = $(this);
        var removeItem = function (result, myModal) {
            if(typeof type !== 'undefined' && type == "refresh"){
                location.reload();
                return;
            }
            if(typeof the_element.data('parent') !== 'undefined'){
                $(the_element.data('parent')+' .box-item[data-id='+the_element.data('id')+']').parent().slideUp(500).delay(500).remove();
                myModal.modal('hide');
                return;
            }
            if(typeof the_element.data('target') !== 'undefined'){
                $(the_element.data('target')).slideUp(500).delay(500).remove();
                myModal.modal('hide');
                return;
            }
            toastr.success(result.msg, 'Success');
            myModal.modal('hide');
        };
        $.loadConfirmModal(url, removeItem);
    };

    $.fn.ajaxToggleActionButton = function (url, btn_lass_1, btn_class_2, success) {
        var the_element = $(this);
        var btn_caption_default = the_element.html(), btn_caption_1 = the_element.data('caption1'), btn_caption_2 = the_element.data('caption2');
        $.ajax({
            url:url,
            dataType:"json",
            beforeSend: function () {
                the_element.addClass("disabled");
                the_element.append($('<i class="fa fa-spinner fa-pulse"></i>'));
            },
            complete: function () {
                the_element.removeClass("disabled");
                the_element.find('i.fa-spinner.fa-pulse').remove();
            },
            success: function (result) {
                if(result.status == "success"){
                    the_element.toggleClass(btn_class_1+" "+btn_class_2);
                    if(btn_caption_default==btn_caption_1){
                        btn_caption_default = btn_caption_2;
                    }
                    else{
                        btn_caption_default = btn_caption_1;
                    }
                    the_element.html(btn_caption_default);
                    if((typeof success)=="function")
                        success();
                    toastr.success(result.msg, translate('Success'));
                }else{
                    toastr.error(result.error, translate('Error'));
                }
            },
            error: function (xhr, status, error) {
                // var err = eval("(" + xhr.responseText + ")");
                alert(xhr.responseText);
                toastr.error('Send form with ajax failed!', 'Error')
            }
        });
    };

    $.fn.ajaxActionButton = function (url, success, success_msg) {
        var the_element = $(this);
        $.ajax({
            url:url,
            dataType:"json",
            beforeSend: function () {
                the_element.addClass("disabled");
                the_element.append($('<i class="fa fa-spinner fa-pulse"></i>'));
            },
            complete: function () {
                the_element.removeClass("disabled");
                the_element.find('i.fa-spinner.fa-pulse').remove();
            },
            success: function (result) {
                if(result.status == "success"){
                    if((typeof success_msg)!="boolean" || success_msg == true)
                        toastr.success(result.msg, 'Success');
                    if((typeof success)=="function")
                        success(result);
                }else{
                    var StrippedString = result.error.replace(/(<([^>]+)>)/ig,"");
                    if(result.error == StrippedString)
                        toastr.error(result.error, translate('Error'));
                    else
                        $.showInModal(translate('Error')+': '+translate('Ajax failed!'), '<div class="alert alert-danger">' +
                            translate('Error') +
                            '</div>' +
                            result.error);
                }
            },
            error: function (xhr, status, error) {
                $.showInModal(translate('Error')+': '+translate('Ajax failed!'), '<div class="alert alert-danger">' +
                    '<h4>'+translate('Error')+'</h4>' +
                    error +
                    '</div>' +
                    '<h4>'+translate('Result')+'</h4>' +
                    xhr.responseText);
            }
        });
    };

    $.fn.ajaxRefreshActionButton = function (url, success) {
        var the_element = $(this);
        $.ajax({
            url:url,
            dataType:"json",
            beforeSend: function () {
                the_element.addClass("disabled");
                the_element.find('i.fa-refresh').addClass("fa-pulse");
            },
            complete: function () {
                the_element.removeClass("disabled");
                the_element.find('i.fa-refresh').removeClass("fa-pulse");
            },
            success: function (result) {
                if(result.status == "success"){
                    success(result.data);
                }else{
                    toastr.error(result.error, 'Error')
                }
            },
            error: function () {
                toastr.error('Send form with ajax failed!', 'Error')
            }
        });
    };

    $.fn.ajaxAppendLastRow = function (url) {
        var the_element = $(this);
        var $loading = $("<div class='loading'><i class='fa fa-spinner fa-pals'></i></div>");
        $.ajax({
            url:url,
            dataType:"json",
            beforeSend: function () {
                the_element.append($loading);
            },
            complete: function () {
                the_element.find('.loading').remove();
            },
            success: function (result) {
                if(result.status == "success"){
                    the_element.append(result.data);
                }else{
                    toastr.error(result.error, 'Error')
                }
            },
            error: function () {
                toastr.error('Send form with ajax failed!', 'Error')
            }
        });
    };

    $.fn.insertHTMLAtTexteditor = function(areaId) {
       var html_code = $(this).find('textarea').val();
       CKEDITOR.instances[areaId].insertHtml(html_code, 'html');
    };

    // Select or highlight current menu item
    $.fn.highlight_selected_menu = function(){
        var item = $(this);
        if(item.length == 0) return;
        var myParent = item.parent('ul');
        if(myParent.hasClass('sub-menu')){
            item.addClass("active");
            if(item.find('sub-menu').length > 0){
                $("#"+item.attr("id")+" > a:first-child .arrow").addClass('open');
            }
            myParent.parent('li').highlight_selected_menu();
        }else{
            item.addClass("active star open");
            if(item.find('sub-menu').length > 0){}

            $("#"+item.attr("id")+" > a:first-child")
                .append($('<span class="selected"></span>'))
                .find('.arrow').addClass('open');
        }
    };

    var currencyFormatSettings = {};
    $.setCurrencyFormatSettings = function (options) {
        var default_settings = {
            before_sign: '',
            after_sign: '',
            currency_code: '',
            // Only able to be "1.234,56", "1,234.56", "1.234", and "1,234"
            number_format: '1,234.56'
        };
        currencyFormatSettings = $.extend(default_settings, options );
    };
    $.currencyFormat = function (value) {
        var default_settings = {
            before_sign: '',
            after_sign: '',
            currency_code: '',
            // Only able to be "1.234,56", "1,234.56", "1.234", and "1,234"
            number_format: '1,234.56'
        };
        var settings = (typeof currencyFormatSettings != 'undefined') ? $.extend(default_settings, currencyFormatSettings ) : default_settings;

        function formatMoney(n, c, d, t) {
            var c = isNaN(c = Math.abs(c)) ? 2 : c,
                d = d == undefined ? "." : d,
                t = t == undefined ? "," : t,
                s = n < 0 ? "-" : "",
                i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
                j = (j = i.length) > 3 ? j % 3 : 0;

            return settings.before_sign + s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "") + settings.after_sign;
        }
        if(settings.number_format = "1.234,56"){
            return formatMoney(value,2,'.',',');
        }
        else if(settings.number_format = "1,234.56"){
            return formatMoney(value,2,',','.');
        }
        else if(value = "1.234"){
            return formatMoney(value,0,'.','');
        }
        else if(value = "1,234"){
            return formatMoney(value,0,',','');
        }
        else{
            alert("The format of currency is unknown.");
        }
    };

    $.fn.handleAutomatics = function () {
        var the_parent = $(this);
        // Handle select2 select boxes
        the_parent.find('.input-select2').each(function () {
            $(this).select2({
                allowClear: true,
                width: null
            });
        });

        // Handle load ajax contents
        the_parent.find('.load-ajax-content').each(function () {
            $(this).loadIn($(this).data('load'));
        });

        // Handle auto ajax in a box
        the_parent.find('div[data-role="auto-load"]').each(function () {
            var e404 = typeof $(this).data('empty') != "undefined" && $(this).data('empty') == 1;
            $(this).loadIn($(this).data('url'), e404);
        });

        // Handle ajax load in a box with click a button
        the_parent.find('.load-ajax-content-btn').click(function () {
            $($(this).data('target')).html('<p class="text-center margin-top-40 margin-bottom-40">' +
                '<i class="fa fa-spinner fa-pulse fa-2x"></i> Loading...' +
                '</p>');
            $($(this).data('target')).loadIn($(this).data('load'));
        });

        // Handle load ajax in a tab
        the_parent.find('a[data-role="auto-load-tab"]').click(function () {
            var $tab_button = $(this), $tab_box = $($tab_button.attr('href'));
            $tab_box.html('<i class="fas fa-spinner fa-pulse fa-1x"></i> <span class="font-lg">'+translate("Loading")+'</span>');
            $tab_box.loadIn($tab_button.data('url'));
        });

        // Handle doing click automatically using keyboard or touch to select a tab
        the_parent.find('.active > a[data-role="auto-load-tab"]').each(function () {
            $(this).trigger("click");
        });

        // Handle toggle hidden and display elements with checking the radio buttons
        the_parent.find('input[type="radio"][data-role="toggle-hidden"]').change(function () {
            $('input[type="radio"][data-role="toggle-hidden"][name="'+$(this).attr('name')+'"]').not(this).each(function () {
                $($(this).data('target')).addClass('hidden');
            });
            $($('input[type="radio"][data-role="toggle-hidden"][name="'+$(this).attr('name')+'"]:checked').data('target')).removeClass('hidden');
        });

        // Handle make enable and disable elements with checking the radio buttons
        the_parent.find('input[type="radio"][data-role="toggle-disabled"]').change(function () {
            $('input[type="radio"][data-role="toggle-disabled"][name="'+$(this).attr('name')+'"]').not(this).each(function () {
                $($(this).data('target')).attr('disabled','disabled');
            });
            $($(this).data('target')).removeAttr('disabled');
        });

        // Handle default value of a select
        the_parent.find('select').each(function () {
            if(typeof $(this).data('default')!='undefined' && $(this).find('option[value="'+$(this).data('default')+'"]').length > 0){
                $(this).val($(this).data('default'));
            }
        });

        // Handle hidden and display elements with checking the check boxes
        the_parent.find('input[type="checkbox"][data-role="toggle-hidden"]').click(function () {
            if($(this).is(":checked"))
                $($(this).data('target')).removeClass("d-none");
            else
                $($(this).data('target')).addClass("d-none");
        });
    };
}(jQuery));

$(function () {
    $('body').checkEditorLoad().handleAutomatics();

    $('a.btn-spinner').makeSpinnerBtn();

    var handleGoTop = function() {
        var offset = 300;
        var duration = 500;

        if (navigator.userAgent.match(/iPhone|iPad|iPod/i)) { // ios supported
            $(window).bind("touchend touchcancel touchleave", function(e) {
                if ($(this).scrollTop() > offset) {
                    $('.scroll-to-top').fadeIn(duration);
                } else {
                    $('.scroll-to-top').fadeOut(duration);
                }
            });
        } else { // general
            $(window).scroll(function() {
                if ($(this).scrollTop() > offset) {
                    $('.scroll-to-top').fadeIn(duration);
                } else {
                    $('.scroll-to-top').fadeOut(duration);
                }
            });
        }

        $('.scroll-to-top').click(function(e) {
            e.preventDefault();
            $('html, body').animate({
                scrollTop: 0
            }, duration);
            return false;
        });
    };
    handleGoTop();
});