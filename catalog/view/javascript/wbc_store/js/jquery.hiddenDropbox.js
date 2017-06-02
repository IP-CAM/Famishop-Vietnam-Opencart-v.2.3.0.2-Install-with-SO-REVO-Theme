/// <reference path="../../../../Scripts/jquery-1.7.2.min.js" />

(function ($) {

    HiddenDropbox = function (_options) {

        //start init

        this.settings = _options;

        this.ensureDefault = function (settingName, defaultValue) {
            this.settings[settingName] = (this.settings[settingName] == undefined) ? defaultValue : this.settings[settingName];
        };

        this.ensureDefault('data', []);
        this.ensureDefault('optionClass', '');
        this.ensureDefault('change', function () { });

        var $$this = this;
        var $this = $(this);

        this.enable = true;

        $this.addClass('hidden-dropbox');

        var id = $this.attr('id');

        if ($this.children('label').length == 0) {
            $this.append('<label class="hidden-dropbox-text"></label>');
        }else {
            $this.children('label').addClass("hidden-dropbox-text");            
        }

        if ($this.children('input[type=hidden]').length == 0)
            $this.append('<input type="hidden" id="hddValue_' + id + '" />');

        if ($this.children('.hidden-dropbox-options').length == 0)
            $this.append('<div class="hidden-dropbox-options ' + this.settings.optionClass + '"></div>');

        this.value = $this.children('input[type=hidden]');
        this.text = $this.children('label');
        this.options = $this.children('.hidden-dropbox-options');

        this.defaultText = $this.attr('placeholder');
        if (this.defaultText == undefined)
            this.defaultText = 'Chọn';

        this.data = this.settings.data;

        this.text.unbind('click');

        this.text.bind('click', this, function (evt) {

            if (evt.data.enable == false) {
                alert('Bạn hãy xóa vùng khoanh trên bản đồ');
                return;
            }

            if (evt.data.options.hasClass('hidden-dropbox-options-hover') == false) {
                 
                $('.hidden-dropbox-options').removeClass("hidden-dropbox-options-hover");
                $('.hidden-dropbox').removeClass('hidden-dropbox-current');

                var width = evt.data.options.width();
                //var currentLeft = $this.position().left;
                var currentLeft = evt.pageX;

                if (currentLeft + width > $('body').width()) {
                    var left = -1 * (currentLeft + width + 20 - $('body').width());
                    evt.data.options.css('left', left + 'px');
                } else {
                    evt.data.options.css('left', '0px');
                }

                evt.data.options.addClass('hidden-dropbox-options-hover');

                evt.data.addClass('hidden-dropbox-current');

            } else {
                $('.hidden-dropbox-options').removeClass("hidden-dropbox-options-hover");
            }

        });

        this.options.unbind('hover');
        this.options.hover(function () {
            $(this).addClass('hidden-dropbox-options-hover');
        }, function () {
            $(this).removeClass("hidden-dropbox-options-hover");
        });

        //end init

        this.getText = function () {
            return this.text.text();
        }

        this.getHtmlOptions = function () {

            var html = '';

            html = '<table border="0"><tr>';

            if (this.data.length > 0 && this.data[0].length > 0) {
                for (var i = 0; i < this.data.length; i++) {
                    html += '<td>';
                    for (var j = 0; j < this.data[i].length; j++) {
                        if (i == 0 && j == 0)
                            html += '<span val="" class="hidden-dropbox-options-defaultvalue">'+ this.defaultText +'</span>';

                        if (this.data[i][j][0] + '' == this.value.val()) {
                            html += '<span class="current" val="' + this.data[i][j][0] + '">' + this.data[i][j][1] + '</span>';
                        }
                        else {
                            html += '<span val="' + this.data[i][j][0] + '">' + this.data[i][j][1] + '</span>';
                        }
                    }
                    html += '</td>';
                }
            } else {
                html += '<td><span val="" class="hidden-dropbox-options-defaultvalue">  Chọn  </span></td>';
            }

            html += '</tr></table>';

            return html;
        }

        this.clearValue = function () {
            this.value.val('');
            this.text.text(this.defaultText);
        }

        this.setEnable = function () {
            this.enable = true;
        }

        this.setDisable = function () {
            this.enable = false;
        }

        this.getValue = function () {
            return this.value.val();
        }

        this.getValueData = function () {
            var val = this.getValue();
            for (var i = 0; i < this.data.length; i++) {
                for (var j = 0; j < this.data[i].length; j++) {
                    if (this.data[i][j][0] + '' == val) {
                        return this.data[i][j];
                    }
                }
            }
        }

        this.setValue = function (val, callback) {
            for (var i = 0; i < this.data.length; i++) {
                for (var j = 0; j < this.data[i].length; j++) {
                    if (this.data[i][j][0] + '' == val) {
                        if (this.value.val() != val) {

                            this.value.val(val);

                            this.settings.change(this, this.settings.scope, callback);
                        }

                        this.value.val(val);
                        this.text.text(this.data[i][j][1]);
                        this.text.attr('title', this.data[i][j][1]);
                        this.options.find('span').removeClass('current');
                        this.options.find('span[val='+ val +']').addClass('current');
                        return;
                    }
                }
            }

            this.clearValue();
        }

        this.ReLoadData = function (_data) {
            if (_data != undefined) {
                this.data = _data;
            }

            this.options.html(this.getHtmlOptions());

            this.options.find('span').bind('click', this, function (evt) {

                evt.data.text.text($(this).text());
                evt.data.text.attr('title', $(this).text());
                evt.data.value.val($(this).attr('val'));
                evt.data.options.removeClass("hidden-dropbox-options-hover");
                evt.data.options.find('span').removeClass('current');
                $(this).addClass('current');

                evt.data.settings.change(evt.data, evt.data.settings.scope, true);

            });

            ///reset text value;
            for (var i = 0; i < this.data.length; i++) {
                for (var j = 0; j < this.data[i].length; j++) {
                    if (this.data[i][j][0] + '' == this.value.val()) {
                        this.text.text(this.data[i][j][1]);
                        return;
                    }
                }
            }
            
            this.clearValue();
        }

        if (this.settings.value != undefined && this.settings.value != null) {
            this.value.val(this.settings.value);
        } else {
            this.value.val('');
        }

        this.ReLoadData();

        //start load default value

        if (this.settings.value != undefined && this.settings.value != null) {
            var _break = false;

            for (var i = 0; i < this.data.length; i++) {
                for (var j = 0; j < this.data[i].length; j++) {
                    if (this.data[i][j][0] + '' == this.settings.value) {
                        this.text.text(this.data[i][j][1]);
                        this.text.attr('title', this.data[i][j][1]);
                        this.settings.change(this, this.settings.scope);
                        _break = true;
                        break;
                    }
                }
                if (_break)
                    break;
            }
        }

        //endstart load default value

        return this;

    }

    HiddenDropbox.getValueById = function () {
        var id = $(this).attr('id');
        return $('#hddValue_' + id).val();
    }

    $.fn.HiddenDropbox = HiddenDropbox;
    $.fn.HiddenDropboxValue = HiddenDropbox.getValueById;

}(jQuery));