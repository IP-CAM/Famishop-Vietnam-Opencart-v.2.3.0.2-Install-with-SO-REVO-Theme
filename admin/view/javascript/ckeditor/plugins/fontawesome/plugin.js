function in_array(t,e){for(var a in e)if(e[a]==t)return!0;return!1}CKEDITOR.plugins.add("fontawesome",{requires:"widget",icons:"fontawesome",init:function(t){CKEDITOR.dialog.add("fontawesome",this.path+"dialogs/fontawesome.js"),t.addContentsCss(this.path+"font-awesome/css/font-awesome.min.css"),t.widgets.add("FontAwesome",{button:"Insert Font Awesome",template:'<span class="" style=""></span>',allowedContent:"span[style](!fa*)",requiredContent:"span(!fa)",dialog:"fontawesome",upcast:function(t){return"span"==t.name&&t.hasClass("fa")},init:function(){this.setData("class",this.element.getAttribute("class")),this.setData("color",this.element.getStyle("color")),this.setData("size",this.element.getStyle("font-size"));var t=["fa-rotate-90","fa-rotate-180","fa-rotate-270","fa-flip-horizontal","fa-flip-vertical"],e=this.element.getAttribute("class").split(" ");in_array("fa",e)&&this.setData("icon",[e[0],e[1]]),in_array("fa-spin",e)&&this.setData("spinning","fa-spin"),in_array("fa-fw",e)&&this.setData("fixedwidth","fa-fw"),in_array("fa-border",e)&&this.setData("bordered","fa-border");for(var a=0;a<t.length;a++)if(in_array(t[a],e)){this.setData("flippedrotation",t[a]);break}},data:function(){""==this.data.color?this.element.removeStyle("color"):this.element.setStyle("color",this.data.color),""==this.data.size?this.element.removeStyle("font-size"):this.element.setStyle("font-size",this.data.size);var t="";this.data.icon&&(t+=this.data.icon[0],t+=" "+this.data.icon[1]),this.data.spinning&&(t+=" "+this.data.spinning),this.data.fixedwidth&&(t+=" "+this.data.fixedwidth),this.data.bordered&&(t+=" "+this.data.bordered),this.data.flippedrotation&&(t+=" "+this.data.flippedrotation),this.element.setAttribute("class",t)}})},onLoad:function(){CKEDITOR.document.appendStyleSheet(this.path+"font-awesome/css/font-awesome.min.css"),CKEDITOR.document.appendStyleSheet(this.path+"css/dialog.css")}});
