var InfoBoxType = {
  Product: 0,
  Project: 1,
  Utility: 2
};
var mapDirImage ="/catalog/view/javascript/wbc_store/images";

function InfoBox(a) {
  a = a || {};
  google.maps.OverlayView.apply(this, arguments);
  this.content_ = a.content || "";
  this.disableAutoPan_ = a.disableAutoPan || false;
  this.maxWidth_ = a.maxWidth || 0;
  this.pixelOffset_ = a.pixelOffset || new google.maps.Size(0, 0);
  this.position_ = a.position || new google.maps.LatLng(0, 0);
  this.zIndex_ = a.zIndex || null;
  this.boxClass_ = a.boxClass || "infoBox";
  this.boxStyle_ = a.boxStyle || {};
  this.closeBoxMargin_ = a.closeBoxMargin || "2px";
  this.closeBoxURL_ = a.closeBoxURL || "http://www.google.com/intl/en_us/mapfiles/close.gif";
  if (a.closeBoxURL === "") {
    this.closeBoxURL_ = ""
  }
  this.infoBoxClearance_ = a.infoBoxClearance || new google.maps.Size(1, 1);
  if (typeof a.visible === "undefined") {
    if (typeof a.isHidden === "undefined") {
      a.visible = true
    } else {
      a.visible = !a.isHidden
    }
  }
  this.isHidden_ = !a.visible;
  this.alignBottom_ = a.alignBottom || false;
  this.pane_ = a.pane || "floatPane";
  this.enableEventPropagation_ = a.enableEventPropagation || false;
  this.div_ = null;
  this.closeListener_ = null;
  this.moveListener_ = null;
  this.contextListener_ = null;
  this.eventListeners_ = null;
  this.fixedWidthSet_ = null;
  this.listeners_ = [];
  this.pictureClickCallBack_ = null;
  this.pictureClickContext_ = null;
  this._infoBoxType = InfoBoxType.Product
}
InfoBox.prototype = new google.maps.OverlayView();
InfoBox.prototype.createInfoBoxDiv_ = function () {
  var i;
  var a;
  var b;
  var c = this;
  var d = function (e) {
    e.cancelBubble = true;
    if (e.stopPropagation) {
      e.stopPropagation()
    }
  };
  var f = function (e) {
    e.returnValue = false;
    if (e.preventDefault) {
      e.preventDefault()
    }
    if (!c.enableEventPropagation_) {
      d(e)
    }
  };
  if (!this.div_) {
    this.div_ = document.createElement("div");
    var g = document.createElement("div");
    g.className = "myInfoWindow-head";
    var h = document.createElement("div");
    h.className = "myInfoWindow-body";
    var j = document.createElement("div");
    if (this.closeBoxURL_ != undefined && this.closeBoxURL_.length > 0) {
      var k = document.createElement("img");
      k.style.cursor = "pointer";
      k.style.position = "absolute";
      k.style.top = '10px';
      k.style.right = '10px';
      k.src = this.closeBoxURL_;
      k.className = 'closeButton'
    }
    this.setBoxStyle_();
    if (typeof this.content_.nodeType === "undefined") {
      j.innerHTML = this.content_
    } else {
      j.appendChild(this.content_)
    }
    h.appendChild(k);
    h.appendChild(j);
    g.appendChild(h);
    this.div_.appendChild(g);
    this.getPanes()[this.pane_].appendChild(this.div_);
    this.addClickHandler_();
    if (this.div_.style.width) {
      this.fixedWidthSet_ = true
    } else {
      if (this.maxWidth_ !== 0 && this.div_.offsetWidth > this.maxWidth_) {
        this.div_.style.width = this.maxWidth_;
        this.div_.style.overflow = "auto";
        this.fixedWidthSet_ = true
      } else {
        b = this.getBoxWidths_();
        this.div_.style.width = (this.div_.offsetWidth - b.left - b.right) + "px";
        this.fixedWidthSet_ = false
      }
    }
    this.panBox_(this.disableAutoPan_);
    if (!this.enableEventPropagation_) {
      this.eventListeners_ = [];
      a = ["mousemove", "mousedown", "mouseover", "mouseout", "mouseup", "click", "dblclick", "touchstart", "touchend", "touchmove"];
      for (i = 0; i < a.length; i++) {
        this.eventListeners_.push(google.maps.event.addDomListener(this.div_, a[i], d))
      }
      this.eventListeners_.push(google.maps.event.addDomListener(this.div_, "mouseover", function (e) {
        this.style.cursor = "default"
      }))
    }
    this.contextListener_ = google.maps.event.addDomListener(this.div_, "contextmenu", f);
    google.maps.event.trigger(this, "domready")
  }
};
InfoBox.prototype.addClickHandler_ = function () {
  var a;
  this.addCancelHandler_(this.div_);
  if (this.closeBoxURL_ !== "") {
    a = this.div_.firstChild.firstChild.firstChild;
    this.closeListener_ = google.maps.event.addDomListener(a, "click", this.getCloseClickHandler_())
  } else {
    this.closeListener_ = null
  }
};
InfoBox.events = ['mousedown', 'mousemove', 'mouseover', 'mouseout', 'mouseup', 'mousewheel', 'DOMMouseScroll', 'touchstart', 'touchend', 'touchmove', 'dblclick', 'contextmenu', 'click'];
InfoBox.prototype.addCancelHandler_ = function (a) {
  if (a.tagName.toLowerCase() == 'img' && a.className == 'closeButton') {
    return
  }
  var b = this;
  this.listeners_.push(google.maps.event.addDomListener(a, 'click', function (e) {
    if (e.type == 'click') {
      if (e.toElement && e.toElement.tagName.toLowerCase() == 'img') {
        if (b.pictureClickCallBack_ != null) {
          b.pictureClickCallBack_(b.pictureClickContext_)
        }
      }
    }
    e.cancelBubble = true;
    if (e.stopPropagation) {
      e.stopPropagation()
    }
  }));
  for (var i = 0; i < a.childElementCount; i++) {
    this.addCancelHandler_(a.children[i])
  }
};
InfoBox.prototype.pictureClickHandler = function (a, b) {
  this.pictureClickCallBack_ = b;
  this.pictureClickContext_ = a
};
InfoBox.prototype.getCloseClickHandler_ = function () {
  var a = this;
  return function (e) {
    e.cancelBubble = true;
    if (e.stopPropagation) {
      e.stopPropagation()
    }
    a.close();
    google.maps.event.trigger(a, "closeclick");
    a.closeInfoCallBack()
  }
};
InfoBox.prototype.closeInfoCallBack = function () {};
InfoBox.prototype.getCancelHandler_ = function (a) {
  return function (e) {
    e.cancelBubble = true;
    e.stopPropagation()
  }
};
InfoBox.prototype.panBox_ = function (a) {
  var b;
  var c = 0,
    yOffset = 0;
  if (!a) {
    b = this.getMap();
    if (b instanceof google.maps.Map) {
      if (!b.getBounds().contains(this.position_)) {
        b.setCenter(this.position_)
      }
      var d = b.getDiv();
      var e = d.offsetWidth;
      var f = d.offsetHeight;
      var g = this.pixelOffset_.width;
      var h = this.pixelOffset_.height;
      var i = this.div_.offsetWidth;
      var j = this.div_.offsetHeight;
      var k = this.infoBoxClearance_.width;
      var l = this.infoBoxClearance_.height;
      var m = this.getProjection().fromLatLngToContainerPixel(this.position_);
      if (m.x < 226 && m.y < 276) {
        c = m.x - 226;
        yOffset = m.y - 276
      } else {
        if (m.x < 350 && m.y < 276) {
          c = m.x - 350
        } else {
          if (m.x < ( - g + k)) {
            c = m.x + g - k
          } else if ((m.x + i + g + k) > e) {
            c = m.x + i + g + k - e
          }
        }
        if (this.alignBottom_) {
          if (m.y < (h + l + j)) {
            yOffset = m.y - h - l - j
          } else if ((m.y + h + l) > f) {
            yOffset = m.y + h + l - f
          }
        } else {
          if (m.y < ( - h + l)) {
            yOffset = m.y + h - l
          } else if ((m.y + j + h + l) > f) {
            yOffset = m.y + j + h + l - f
          }
        }
      }
      if (! (c === 0 && yOffset === 0)) {
        b.panBy(c, yOffset)
      }
    }
  }
};
InfoBox.prototype.setBoxStyle_ = function () {
  var i, boxStyle;
  if (this.div_) {
    this.div_.className = this.boxClass_;
    this.div_.style.cssText = "";
    boxStyle = this.boxStyle_;
    for (i in boxStyle) {
      if (boxStyle.hasOwnProperty(i)) {
        this.div_.style[i] = boxStyle[i]
      }
    }
    if (typeof this.div_.style.opacity !== "undefined" && this.div_.style.opacity !== "") {
      this.div_.style.filter = "alpha(opacity=" + (this.div_.style.opacity * 100) + ")"
    }
    this.div_.style.position = "absolute";
    this.div_.style.visibility = 'hidden';
    if (this.zIndex_ !== null) {
      this.div_.style.zIndex = this.zIndex_
    }
  }
};
InfoBox.prototype.getBoxWidths_ = function () {
  var a;
  var b = {
    top: 0,
    bottom: 0,
    left: 0,
    right: 0
  };
  var c = this.div_;
  if (document.defaultView && document.defaultView.getComputedStyle) {
    a = c.ownerDocument.defaultView.getComputedStyle(c, "");
    if (a) {
      b.top = parseInt(a.borderTopWidth, 10) || 0;
      b.bottom = parseInt(a.borderBottomWidth, 10) || 0;
      b.left = parseInt(a.borderLeftWidth, 10) || 0;
      b.right = parseInt(a.borderRightWidth, 10) || 0
    }
  } else if (document.documentElement.currentStyle) {
    if (c.currentStyle) {
      b.top = parseInt(c.currentStyle.borderTopWidth, 10) || 0;
      b.bottom = parseInt(c.currentStyle.borderBottomWidth, 10) || 0;
      b.left = parseInt(c.currentStyle.borderLeftWidth, 10) || 0;
      b.right = parseInt(c.currentStyle.borderRightWidth, 10) || 0
    }
  }
  return b
};
InfoBox.prototype.onRemove = function () {
  if (this.div_) {
    this.div_.parentNode.removeChild(this.div_);
    this.div_ = null
  }
};
InfoBox.prototype.draw = function () {
  this.createInfoBoxDiv_();
  var a = this.getProjection().fromLatLngToDivPixel(this.position_);
  this.div_.style.left = (a.x + this.pixelOffset_.width) + "px";
  if (this.alignBottom_) {
    this.div_.style.bottom = -(a.y - this.pixelOffset_.height) + "px"
  } else {
    this.div_.style.top = (a.y - this.pixelOffset_.height) + "px"
  }
  if (this.isHidden_) {
    this.div_.style.visibility = 'hidden'
  } else {
    this.div_.style.visibility = "visible"
  }
};
InfoBox.prototype.setOptions = function (a) {
  if (typeof a.boxClass !== "undefined") {
    this.boxClass_ = a.boxClass;
    this.setBoxStyle_()
  }
  if (typeof a.boxStyle !== "undefined") {
    this.boxStyle_ = a.boxStyle;
    this.setBoxStyle_()
  }
  if (typeof a.content !== "undefined") {
    this.setContent(a.content)
  }
  if (typeof a.disableAutoPan !== "undefined") {
    this.disableAutoPan_ = a.disableAutoPan
  }
  if (typeof a.maxWidth !== "undefined") {
    this.maxWidth_ = a.maxWidth
  }
  if (typeof a.pixelOffset !== "undefined") {
    this.pixelOffset_ = a.pixelOffset
  }
  if (typeof a.alignBottom !== "undefined") {
    this.alignBottom_ = a.alignBottom
  }
  if (typeof a.position !== "undefined") {
    this.setPosition(a.position)
  }
  if (typeof a.zIndex !== "undefined") {
    this.setZIndex(a.zIndex)
  }
  if (typeof a.closeBoxMargin !== "undefined") {
    this.closeBoxMargin_ = a.closeBoxMargin
  }
  if (typeof a.closeBoxURL !== "undefined") {
    this.closeBoxURL_ = a.closeBoxURL
  }
  if (typeof a.infoBoxClearance !== "undefined") {
    this.infoBoxClearance_ = a.infoBoxClearance
  }
  if (typeof a.isHidden !== "undefined") {
    this.isHidden_ = a.isHidden
  }
  if (typeof a.visible !== "undefined") {
    this.isHidden_ = !a.visible
  }
  if (typeof a.enableEventPropagation !== "undefined") {
    this.enableEventPropagation_ = a.enableEventPropagation
  }
  if (this.div_) {
    this.draw()
  }
};
InfoBox.prototype.setContent = function (a) {
  this.content_ = a;
  this.pictureClickCallBack_ = null;
  if (this.div_) {
    if (this.closeListener_) {
      google.maps.event.removeListener(this.closeListener_);
      this.closeListener_ = null
    }
    if (!this.fixedWidthSet_) {
      this.div_.style.width = ""
    }
    if (typeof a.nodeType === "undefined") {
      this.div_.firstChild.firstChild.children[1].innerHTML = a
    } else {
      this.div_.firstChild.firstChild.children[1].innerHTML = '';
      this.div_.firstChild.firstChild.children[1].appendChild(a)
    }
    if (!this.fixedWidthSet_) {
      this.div_.style.width = this.div_.offsetWidth + "px";
      if (typeof a.nodeType === "undefined") {
        this.div_.firstChild.firstChild.children[1].innerHTML = a
      } else {
        this.div_.firstChild.firstChild.children[1].innerHTML = '';
        this.div_.firstChild.firstChild.children[1].appendChild(a)
      }
    }
    this.addClickHandler_()
  }
  google.maps.event.trigger(this, "content_changed")
};
InfoBox.prototype.setPosition = function (a) {
  this.position_ = a;
  if (this.div_) {
    this.draw()
  }
  google.maps.event.trigger(this, "position_changed")
};
InfoBox.prototype.setZIndex = function (a) {
  this.zIndex_ = a;
  if (this.div_) {
    this.div_.style.zIndex = a
  }
  google.maps.event.trigger(this, "zindex_changed")
};
InfoBox.prototype.setVisible = function (a) {
  this.isHidden_ = !a;
  if (this.div_) {
    this.div_.style.visibility = (this.isHidden_ ? "hidden": "visible")
  }
};
InfoBox.prototype.getContent = function () {
  return this.content_
};
InfoBox.prototype.getPosition = function () {
  return this.position_
};
InfoBox.prototype.getZIndex = function () {
  return this.zIndex_
};
InfoBox.prototype.getVisible = function () {
  var a;
  if ((typeof this.getMap() === "undefined") || (this.getMap() === null)) {
    a = false
  } else {
    a = !this.isHidden_
  }
  return a
};
InfoBox.prototype.show = function () {
  this.isHidden_ = false;
  if (this.div_) {
    this.div_.style.visibility = "visible"
  }
};
InfoBox.prototype.hide = function () {
  this.isHidden_ = true;
  if (this.div_) {
    this.div_.style.visibility = "hidden"
  }
};
InfoBox.prototype.open = function (a, b, c, d) {
  var e = this;
  this.pixelOffset_.height = c;
  if (b) {
    this.position_ = b.getPosition();
    this.moveListener_ = google.maps.event.addListener(b, "position_changed", function () {
      e.setPosition(this.getPosition())
    })
  }
  if (typeof(d) == 'undefined') {
    this._infoBoxType = InfoBoxType.Product
  } else {
    this._infoBoxType = d
  }
  this.setMap(a);
  if (this.div_) {
    this.panBox_()
  }
};
InfoBox.prototype.close = function () {
  var i;
  if (this.closeListener_) {
    google.maps.event.removeListener(this.closeListener_);
    this.closeListener_ = null
  }
  if (this.eventListeners_) {
    for (i = 0; i < this.eventListeners_.length; i++) {
      google.maps.event.removeListener(this.eventListeners_[i])
    }
    this.eventListeners_ = null
  }
  if (this.moveListener_) {
    google.maps.event.removeListener(this.moveListener_);
    this.moveListener_ = null
  }
  if (this.contextListener_) {
    google.maps.event.removeListener(this.contextListener_);
    this.contextListener_ = null
  }
  this.setMap(null)
};


var searchTypeEnum = {
  SearchForm: 0,
  SearchMap: 1
};

var loadingHtml = {
  message: '<img width="40" src="'+mapDirImage+'/map-loading.gif" />',
  css: {
    border: '1px solid #ccc',
    padding: 'none',
    width: '40px',
    height: '40px'
  }
};

var browser = {
  isMobile: window.navigator.userAgent.indexOf('iPad') > 0
};

var minZoomAllowSearch = 10;
var minZoom = 5;

(function ($) {
  function CoordMapType(a) {
    this.tileSize = a
  };

  CoordMapType.prototype.getTile = function (a, b, c) {
    var d = c.createElement('div');
    d.innerHTML = a;
    d.style.width = this.tileSize.width + 'px';
    d.style.height = this.tileSize.height + 'px';
    d.style.fontSize = '10';
    d.style.borderStyle = 'solid';
    d.style.borderWidth = '1px';
    d.style.borderColor = '#AAAAAA';
    return d
  };


  vnTMaps = function (s) {


    var v = $(this).attr('id');
    $thismap = this;
    this.data = [];
    this.map = null;
    this.mapType = s.mapType;
    this.mapPoly = null;
    this.polyline = null;
    this.listLatlgn = null;
    this.markerCluster = null;
    this.geocoder = new google.maps.Geocoder();
    this.directionsService = new google.maps.DirectionsService();
    this.dirRenderer = new google.maps.DirectionsRenderer();
    this.isShowDirections = false;
    this.myLatLng = {} ;
    this.circle = null;
    this.curID = null;
    this.curjID = null;
    this.tooltip = null;

    this.isDrawing = s.lstPoint != undefined && s.lstPoint != '';
    this.isMapIdle = false;
    this.isShowRefreshButton = false;
    this.isShowUtil = false;
    this.infoBoxOptions = {
      disableAutoPan: false,
      maxWidth: 0,
      pixelOffset: new google.maps.Size( - 188, 20),
      zIndex: 1000,
      boxClass: 'myInfoWindow',
      closeBoxURL: mapDirImage+"/close.png",
      infoBoxClearance: new google.maps.Size(1, 1),
      isHidden: false,
      alignBottom: true,
      enableEventPropagation: false
    };
    this.infoWindow = null;
    this.initialize = function () {

      $thismap.curID = s.curID;

      var e = 10;
      if (s.zoom != '') e = parseInt(s.zoom);
      var f = 10.8230989;
      var g = 106.6296638;
      if (s.center != '') {
        f = parseFloat(s.center.split(':')[0]);
        g = parseFloat(s.center.split(':')[1])
      }
      if (s.lstPoint != '') {
        this.isDrawing = true;
        this.isMapIdle = false;
        var h = s.lstPoint.split(',');
        if (h.length >= 5) {
          this.listLatlgn = new Array();
          for (var i = 0; i < h.length; i++) {
            var j = h[i].split(':');
            this.listLatlgn.push(new google.maps.LatLng(parseFloat(j[0]), parseFloat(j[1])))
          }
        }
      }
      var k = {
        center: new google.maps.LatLng(f, g),
        zoom: e,
        overviewMapControl: true,
        overviewMapControlOptions: {
          opened: false
        },
        panControl: false,
        rotateControl: false,
        scaleControl: true,
        zoomControl: true,
        streetViewControl: false,
        mapTypeControl: true,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControlOptions: {
          style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
          position: google.maps.ControlPosition.TOP_RIGHT
        },
        zoomControlOptions: {
          position: google.maps.ControlPosition.TOP_RIGHT
        },
        draggable: true
      };
      this.map = new google.maps.Map(document.getElementById(v), k);
      this.tooltip = new TooltipMK({
        map: this.map
      });


      this.map.controls[google.maps.ControlPosition.BOTTOM_RIGHT].push(document.getElementById('findMe'));

      var m = new google.maps.ImageMapType({
        getTileUrl: function (a, b) {
          return null
        },
        tileSize: new google.maps.Size(256, 256)
      });
      this.map.overlayMapTypes.push(m);
      google.maps.event.addListener(this.map, 'click', function (a) {});
      google.maps.event.addListener(this.map, 'zoom_changed', function () {
        if (this.getZoom() < minZoom) {
          this.setZoom(minZoom);
          return
        }
        $thismap.callBackMapChange()
      });
      if (this.listLatlgn != null) {
        this.polyline = new google.maps.Polygon({
          path: this.listLatlgn,
          strokeColor: '#585858',
          strokeWeight: 3,
          editable: true,
          fillColor: "#ccc",
          fillOpacity: 0.5
        });
        this.polyline.setMap(this.map)
      }


      google.maps.event.addListener(this.map, 'idle', function () {
        var a = this;
        if (a.getZoom() >= minZoomAllowSearch && !$thismap.isDrawing && !$thismap.isShowUtil && !$thismap.IsShowDetail && $thismap.isShowRefreshButton) {

        } else {
          $thismap.isShowRefreshButton = true;
          $thismap.isMapIdle = false
        }
        $thismap.callBackMapChange()
      });

      if (browser.isMobile) {
        this.infoWindow = new google.maps.InfoWindow()
      } else {
        this.infoWindow = new InfoBox(this.infoBoxOptions);
        this.infoWindow.closeInfoCallBack = function () {
          if (this._infoBoxType == InfoBoxType.Utility) return;
          $thismap.IsShowDetail = false;

          var a = $thismap.findMarker($thismap.curID);
          if (a != null) {
            /*a.setIcon({
              url: mapDirImage+"/map_icon.png",
              size: new google.maps.Size(20, 20)
            });*/
            a.setZIndex()
          }
          $thismap.curID = null;

        }
      }
    };
    this.setContext = function (a, b, c) {
      if (a != undefined && a != '') {
        this.showInfoWindow(a)
      }
      if (b != undefined && c != undefined) {
        var d = parseFloat(c.split(':')[0]);
        var e = parseFloat(c.split(':')[1]);
        this.map.setCenter(new google.maps.LatLng(d, e));
        this.map.setZoom(parseInt(b))
      }
    };
    this.getMapBounds = function () {
      var a = $thismap.map.getBounds();
      if (a == undefined) return "";
      var b = a.getNorthEast();
      var c = a.getSouthWest();
      return b.lat() + ":" + c.lng() + "," + c.lat() + ":" + c.lng() + "," + c.lat() + ":" + b.lng() + "," + b.lat() + ":" + b.lng()
    };
    this.getCornerBounds = function () {
      var a = $thismap.map.getBounds();
      if (a == undefined) return null;
      var b = a.getNorthEast();
      var c = a.getSouthWest();
      var d = {
        minLat: c.lat(),
        minLong: c.lng(),
        maxLat: b.lat(),
        maxLong: b.lng()
      };
      return d
    };
    this.getBoundOfPolygon = function (a) {
      var b = a.split(',');
      if (b < 2) return {};
      var c = 0,
        minLat = 100000,
        maxLng = 0,
        minLng = 100000;
      for (var i = 0; i < b.length; i++) {
        var d = b[i].split(':');
        var e = parseFloat(d[0]);
        var f = parseFloat(d[1]);
        if (c < e) c = e;
        if (minLat > e) minLat = e;
        if (minLng > f) minLng = f;
        if (maxLng < f) maxLng = f
      }
      var g = {
        minLat: minLat,
        minLong: minLng,
        maxLat: c,
        maxLong: maxLng
      };
      return g
    };
    this.callBackMapChange = function () {};
    this.getZoom = function () {
      return this.map.getZoom()
    };
    this.getCenter = function () {
      return this.map.getCenter().lat() + ':' + this.map.getCenter().lng()
    };
    this.callBackSearchPlace = function () {};
    this.beginDrawButton = $('.begindraw');
    this.deleteShapeButton = $('.delshape');
    this.fullScreenButton = $('.fullscreen');
    this.exitFullScreenButton = $('.exitfullscreen');
    this.fullScreenButton.bind('click', this, function (a) {

      $('body').css('overflow', 'hidden');

      a.data.exitFullScreenButton.css('display', 'block');
      a.data.fullScreenButton.hide();
      google.maps.event.trigger(a.data.map, "resize")
    });

    this.exitFullScreenButton.bind('click', this, function (a) {

      $('body').css('overflow', 'auto');

      a.data.exitFullScreenButton.hide();
      a.data.fullScreenButton.show();

      google.maps.event.trigger(a.data.map, "resize");


    });

    this.beginDrawButton.bind('click', this, function (b) {
      if (b.data.map.getZoom() < minZoomAllowSearch) {
        alert('Bạn cần phóng to bản đồ hơn nữa vào khu vực bạn cần vẽ');
        return
      }
      $thismap.isDrawing = true;
      b.data.beginDrawButton.hide();
      b.data.deleteShapeButton.show();
      //b.data.ClearUtilitiesAroundPoint();
      b.data.clearPoint();
      b.data.callBackClearPointEvent();
      if (b.data.polyline != undefined) b.data.polyline.setMap(undefined);
      b.data.mapPoly = new google.maps.Polyline({
        strokeColor: '#585858',
        strokeOpacity: 1,
        map: b.data.map
      });
      b.data.map.setOptions({
        draggableCursor: "crosshair",
        draggable: false
      });
      var f = 10;
      var c = 0;
      function _beginDrawEvent(a) {
        return function () {
          a.listLatlgn = new Array();
          function _mouseMoveEvent(j) {
            a.mapPoly.getPath().push(j.latLng);
            var i = new Date().valueOf();
            if (i - c >= f) {
              c = i;
              a.listLatlgn.push(j.latLng)
            }
          }
          google.maps.event.addListener(b.data.map, "mousemove", function (j) {
            _mouseMoveEvent(j)
          })
        }
      };
      if (browser.isMobile) {
        $('body').bind('touchmove', function (e) {
          e.preventDefault();
          e.stopPropagation()
        })
      }
      google.maps.event.addListener(b.data.map, "mousedown", _beginDrawEvent(b.data));
      function _endDrawEvent(a) {
        return function () {
          if (browser.isMobile == false) {
            $('body').unbind('mouseup')
          } else {
            $('body').unbind('touchend')
          }
          if (a.mapPoly != undefined) {
            if (browser.isMobile) {
              $('body').unbind('touchmove')
            }
            a.map.setOptions({
              draggableCursor: "openhand",
              draggable: true
            });
            google.maps.event.clearListeners(a.map, 'mousedown');
            google.maps.event.clearListeners(a.map, 'mousemove');
            a.mapPoly.setMap(undefined);
            a.endDraw();
            a.callBackMapChange()
          }
        }
      };
      if (browser.isMobile == false) {
        $('body').bind('mouseup', this, _endDrawEvent(b.data))
      } else {
        $('body').bind('touchend', this, _endDrawEvent(b.data))
      }
    });
    this.deleteShapeButton.bind('click', this, function (a) {
      a.data.DeleteShape()
    });
    this.DeleteShape = function (a) {
      this.beginDrawButton.show();
      this.deleteShapeButton.hide();
      if (this.polyline != undefined) {
        this.polyline.setMap(undefined);
        this.polyline = null
      }
      this.clearPoint();
      $thismap.isDrawing = false;
      $thismap.isMapIdle = false;
      this.callBackClearPointEvent(true);

    };
    this.endDraw = function (a) {

      if ($thismap.listLatlgn != null) {

        this.beginDrawButton.hide();
        this.deleteShapeButton.show();
        var b = new Array();
        if (a == undefined) {
          var c = 5;
          var x;
          x = Math.round($thismap.listLatlgn.length / 50);
          if ($thismap.listLatlgn.length < 30) {
            c = 1;
            x = 2
          }
          for (var i = 0; i < $thismap.listLatlgn.length; i++) {
            if (i % (c * x) == 0) {
              b.push($thismap.listLatlgn[i])
            }
          }
        } else {
          b = $thismap.listLatlgn
        }
        $thismap.polyline = new google.maps.Polygon({
          path: b,
          strokeColor: '#585858',
          strokeWeight: 3,
          editable: true,
          fillColor: "#ccc",
          fillOpacity: 0.5
        });
        $thismap.polyline.setMap($thismap.map);
        $thismap.findPoint($thismap.polyline, a);

        google.maps.event.addListener($thismap.polyline.getPath(), 'set_at', function () {
          $thismap.findPoint($thismap.polyline)
        });
        google.maps.event.addListener($thismap.polyline.getPath(), 'insert_at', function () {
          $thismap.findPoint($thismap.polyline)
        })
      }
      $thismap.listLatlgn = null
    };
    this.markers = new Array();

    this.callBackDrawEvent = function () {};
    this.findPoint = function (a, b) {
      this.clearPoint();
      var c = a.getPath().getArray();
      var d = 0,
        minLat = 100000,
        maxLng = 0,
        minLng = 100000;
      var e = '';
      for (var i = 0; i < c.length; i++) {
        var f = c[i].lat();
        var g = c[i].lng();
        if (e.length > 0) e += ',';
        e += f + ':' + g;
        if (d < f) d = f;
        if (minLat > f) minLat = f;
        if (minLng > g) minLng = g;
        if (maxLng < g) maxLng = g
      }

      if (this.callBackDrawEvent) {
        this.callBackDrawEvent(d, minLat, maxLng, minLng, e, b)
      }
    };
    this.isInPolyline = function (a, b) {
      if (this.polyline != undefined && this.polyline != null) {
        return google.maps.geometry.poly.containsLocation(new google.maps.LatLng(a, b), this.polyline)
      }
      return true
    };
    this.clearPoint = function () {
      this.infoWindow.close();
      //this.ClearUtilitiesAroundPoint();
      if ($thismap.markers != undefined) {
        for (var t = 0; t < $thismap.markers.length; t++) {
          $thismap.markers[t].setMap(null)
        }
        $thismap.markers = []
      }

      if (this.markerCluster != null) {
        this.markerCluster.clearMarkers()
      }
    };
    this.callBackClearPointEvent = function () {};
    this.showPoint = function (a, b) {
      this.clearPoint();
      for (var j = 0; j < a.length; j++) {
        var c = a[j];
        var d = null;
        if (!device.ipad() && !device.tablet() && !device.ipod() && !device.iphone() && !device.androidTablet() && !device.blackberryTablet() && !device.android()) {
          if (c.vip == 0) d = google.maps.Animation.DROP;
          var f = '<div class="infowindow-preview">';
          f += '<div class="infowindow-preview-detail">';

          f += '<div class="infowindow-preview-title">' + c.title + '</div>';

          if (c.picture.length > 0 && c.picture.indexOf('no-photo.jpg') < 0) {
            f += '<div class="infowindow-preview-picture">';
            f += '<img src="' + c.picture + '" alt="" />';
            f += '</div>'
          }

          f += '<div class="infowindow-info">' + c.address + '</div>';

          f += '</div>';
          f += '</div>'
        }
        $thismap.markers.push(new google.maps.Marker({
          position: new google.maps.LatLng(c.lat, c.lon),
          map: this.map,
          tooltip: f,
          icon: {
            url: c.icon,
            size: new google.maps.Size(30, 40)
          },
          animation: d
        }));
        $thismap.markers[$thismap.markers.length - 1].id = c.id
      }
      for (var i = 0; i < $thismap.markers.length; i++) {
        $thismap.markers[i].addListener('click', function () {
          $thismap.showInfoWindow(this.id)
        });

        /*XU ly hover khi re vao
        $thismap.markers[i].addListener('mouseover', function () {
          if (this.id != $thismap.curID) {
            this.setIcon({
              url: mapDirImage+"/map_icon_hover.png",
              size: new google.maps.Size(27, 40)
            });
            $thismap.tooltip.addTip(this);
            $thismap.tooltip.getPos2(this.getPosition())
          }
        });

        $thismap.markers[i].addListener('mouseout', function () {
          if (this.id != $thismap.curID) {
            this.setIcon({
              url: mapDirImage+"/map_icon.png",
              size: new google.maps.Size(27, 40)
            })
          }
          $thismap.tooltip.removeTip()
        })*/
      }
      if (b !== undefined && b) {
        if (this.polyline != undefined && this.polyline != null) {
          var g = new google.maps.LatLngBounds();
          this.polyline.getPath().forEach(function (e) {
            g.extend(e)
          });
          this.map.fitBounds(g)
        }
      }
    };


    this.ChangeMapByGeolocate = function (c, d) {


      this.map.setCenter(new google.maps.LatLng(c.lat, c.lng));
      this.map.setZoom(d) ;

      this.myLatLng = {lat: c.lat, lng: c.lng};
      var marker = new google.maps.Marker({
        position: this.myLatLng ,
        icon: {
          path: google.maps.SymbolPath.CIRCLE,
          scale: 5,
          strokeColor: '#d69a28',
          strokeOpacity: 0.8,
          strokeWeight: 10,
          fillColor: '#FF0000',
          fillOpacity: 1
        },
        title: "My Locaton" ,
        map: this.map
      });

    };
    this.ChangeMapByAddress = function (c, d) {
      if (typeof(c) == 'string') {
        this.geocoder.geocode({
            'address': c
          },
          function (a, b) {
            if (b == google.maps.GeocoderStatus.OK) {
              $thismap.map.setCenter(a[0].geometry.location);
              $thismap.map.setZoom(d)
            } else {}
          })
      } else {
        this.map.setCenter(new google.maps.LatLng(c.lat, c.lng));
        this.map.setZoom(d)
      }
    };

    this.callBackAfterInfowindowClose = function () {};
    this.callbackShowInfoWindow = function () {};

    // tim duong
    this.DirectionsView = function (id) {

      var text_placeholder = $("#directionsForm").data("placeholder");
      // alert(text_placeholder);
      if(this.myLatLng.lat != undefined)
      {

        $("#origin").val(text_placeholder);
        // $("#directionsForm").submit();
        // alert(text_placeholder);
        $('#getDirections').click();
      }

      $("#origin").focus(function() {
        if( $(this).val()== text_placeholder){
          $(this).val('');
        }
      });

      var destination =''; var destLatLng= '';
      if (this.data != undefined && this.data.length > 0) {
        for (var i = 0; i < this.data.length; i++) {
          if (this.data[i].id == id) {
            destination = this.data[i].address ;
            destLatLng = this.data[i].lat + "," + this.data[i].lon ;
          }
        }
      }

      $("#destination").val(destination) ;
      $("#destLatLng").val(destLatLng) ;

    };

    this.getDirections = function (i, f, g) {

      var text_placeholder = $("#directionsForm").data("placeholder");
      if(this.myLatLng.lat != undefined) {
        if (i === text_placeholder) {
          i = new google.maps.LatLng(this.myLatLng.lat, this.myLatLng.lng);
        }
      }

      var destLatLng =  $("#destLatLng").val();
      if(destLatLng !=="") {
        arr = destLatLng.split(",");
        f = new google.maps.LatLng(arr[0], arr[1]);
      }

      var e = this,
        j = null,
        h = {
          origin: i,
          destination: f,
          provideRouteAlternatives: true,
          durationInTraffic: true,
          travelMode: google.maps.TravelMode[g],
          unitSystem: google.maps.UnitSystem.METRIC
        };
      if (!i || !f || !g) {
        return
      }

      this.directionsService.route(h, function (l, k) {

        $("#directions_waiting").addClass("hide");

        if (l && k === google.maps.DirectionsStatus.OK) {
          e.clearPoint();
          $("#routes").empty();

          $thismap.dirRenderer.setMap($thismap.map);
          $thismap.dirRenderer.setPanel(document.getElementById('routes'));
          $thismap.dirRenderer.setDirections(l) ;
          $thismap.isShowDirections = true;
        } else {
          if (k === google.maps.DirectionsStatus.ZERO_RESULTS) {
             alert('Không tìm thấy kết quả . Vui lòng nhập lại');
          } else {
            if (k === google.maps.DirectionsStatus.NOT_FOUND || k === google.maps.DirectionsStatus.INVALID_REQUEST) {
              j = new google.maps.Geocoder();
              j.geocode({
                  address: i.toString()
                },
                function (m, n) {
                  if (n === google.maps.GeocoderStatus.OK) {
                    alert('Địa chỉ đến không tồn tại. Vui lòng nhập lại');
                  } else {
                    alert('Địa chỉ đi không tồn tại. Vui lòng nhập lại');
                  }
                })
            } else {
              alert('errDirectionService');
            }
          }
        }
      });

    };

    this.callBackClearDirections = function () {
      this.dirRenderer.set('directions', null);
    };
    // end tim duong

    this.IsShowDetail = false;
    this.showInfoWindow = function (d) {
      this.IsShowDetail = true;

      if (d == undefined || d == null) d = this.curID;
      else if (d != this.curID && this.curID != null) {
        var e = this.findMarker(this.curID);
        var f = this.findDataInfo(this.curID);
        if (e != undefined && e != null) {
          /*e.setIcon({
            url: mapDirImage+"/map_icon.png",
            size: new google.maps.Size(20, 20)
          });*/
          if (f != undefined && f != null) {
            e.setZIndex(6 - f.vip)
          }
        }
      } else if (d == this.curID) {}
      if (this.markers != undefined) {
        for (var i = 0; i < this.markers.length; i++) {
          if (this.markers[i].id == d) {
            var g = this.findDataInfo(d);
            if (g != null) {
              this.curID = null;
              //this.CloseProject();
              //this.ClearUtilitiesAroundPoint();

              var h = this.markers[i];
              h.setIcon(g.icon);
              h.setZIndex(300);
              var k = '<div class="infowindow">';
              k += '<div class="infowindow-detail">';

              k += '<div class="infowindow-title"><a href="' + g.detailLink + '" target="_blank">' + g.title + '</a></div>';

              if (g.picture.length > 0) {
                k += '<div class="infowindow-picture">';
                k += '<img class="hasimage" src="' + g.picture + '" alt="" />';
                k += '</div>'
              }

              k += '<div class="info">'
              k += '<div class="address">' + g.address + '</div>';
              if(g.distance)  {
                k += '<div class="distance">' + g.distance + '</div>';
              }
              if(g.time_open) {
                k += '<div class="time_open"><span class="open">OPEN</span><span>' + g.time_open + '</span></div>';
              }
              k += '</div>';


              k += '<div class="infowindow-bottom">';
              //k += '<a href="' + LINK_MOD + '/' + g.detailLink + '"   class="btn">'+js_lang['view_detail']+'</a>';

              k += '<a href="javascript:myControlerObj.ShowDirections(' + g.id + ');" class="btn" >'+js_lang['find_the_way']+'</a>';
              k += '</div>';


              this.infoWindow.setContent(k);
              if (h.map == null) h.setMap(this.map);
              this.infoWindow.open(this.map, h, 20, InfoBoxType.Product);
              google.maps.event.clearListeners(this.infoWindow, 'closeclick');
              this.curID = g.id;

              this.callbackShowInfoWindow(this.curID)
            } else {}
            break
          }
        }
      } else {}
    };
    this.showTipWindow = function (a) {
      var b = this.findMarker(a);
      if (b != null && b.id != $thismap.curjID) {
        $thismap.tooltip.addTip(b);
        $thismap.tooltip.getPos2(b.getPosition());
        /*b.setIcon({
          url:  mapDirImage+"/map_icon_hover.png",
          size: new google.maps.Size(27, 40)
        });*/
        b.setZIndex(300)
      }
    };
    this.hideTipWindow = function (a, b) {
      $thismap.tooltip.removeTip();
      var c = this.findMarker(a);
      if (c != null){
        /*c.setIcon({
          url:mapDirImage+"/map_icon.png",
          size: new google.maps.Size(27, 40)
        });*/
        c.setZIndex(b)
      }

    };
    this.showMap = function (a, b) {
      this.data = [];
      for (var i = 0; i < a.length; i++) {
        if (this.isInPolyline(a[i].lat, a[i].lon)) {
          if (a[i].picture == null || a[i].picture == '') a[i].picture = mapDirImage+'/nophoto.gif';
          this.data.push(a[i])
        }
      }
      this.showPoint(this.data, b);
      return this.data
    };
    this.findDataInfo = function (a) {
      if (this.data != undefined && this.data.length > 0) {
        for (var i = 0; i < this.data.length; i++) {
          if (this.data[i].id == a) {
            return this.data[i]
          }
        }
      }
    };
    this.findMarker = function (a) {
      if (this.markers != undefined) {
        for (var i = 0; i < this.markers.length; i++) {
          if (this.markers[i].id == a) {
            return this.markers[i]
          }
        }
      }
      return null
    };

    return $thismap
  };
  $.fn.vnTMaps = vnTMaps
} (jQuery));



MapSearchControler = function (h) {

  var i = this;
  this.searchVar = {
    page: 0
  };

  var j = {
    zoom: h.context.zoom,
    center: h.context.center,
    lstPoint: h.context.lstPoint,
    mapType: mapType
  };
  this.vnTMaps = $('#map').vnTMaps(j);
  this.vnTMaps.initialize();

  this.vnTMaps.callbackShowInfoWindow = function (a) {
    i.ChangeUrlForNewContext();
  };

  this.vnTMaps.callBackDrawEvent = function (a, b, c, d, e, f, g) {
    i.callBackDrawEvent(a, b, c, d, e, f, g);
  };
  this.vnTMaps.callBackClearPointEvent = function () {
    i.callBackClearPointEvent();
  };
  this.vnTMaps.callBackSearchPlace = function (a, b, c) {
    i.callBackSearchPlace(a, b, c);
  };
  this.vnTMaps.callBackMapChange = function (a) {
    i.ChangeUrlForNewContext();
  };
  this.Initialize(h);

};

MapSearchControler.prototype.Initialize = function (z) {
  $this = this;

  this.viewList = $('#viewList');
  this.viewMap = $('#viewMap');

  this.sortView = $('.sort-view');
  this.itemView = $('.item-view');
  this.pageView = $('.page-view');
  this.boxSearch = $('#boxMapSearch');

  this.itemData = [];
  this.tempItemData = [];
  this.lstPoint = '';
  this.currPageIndex = 0;

  $this.geolocateUser(z);
  $('#findMe').bind('click', this, function (a) {
    $this.geolocateUser(z);
  });


  // tim duong
  var autocompleteOrigin = new google.maps.places.Autocomplete(document.getElementById("origin"));
  autocompleteOrigin.bindTo("bounds", this.vnTMaps.map);
  autocompleteOrigin.setTypes(["geocode"]);

  $("#getDirections").bind('click', this, function (a) {
    var f = $("#origin").val(),
      g = $("#destination").val(),
      e = $("input[name='cat_id']:checked").val();

    $("#directions_waiting").removeClass("hide");
    setTimeout(function () {
      $this.vnTMaps.getDirections(f, g, e);
    },100)
    return false ;
  });

  $("#cancelDirections").bind('click', this, function (a) {
    $this.vnTMaps.isShowDirections = false;
    $this.vnTMaps.dirRenderer.set('directions', null);
    $("#directions").hide();
    $("#viewList").show();
    $this.vnTMaps.showPoint($thismap.data, 0);
    return false ;
  });
  //end tim duong


  $this.InitializeSearch(z);
  var I = {
    keyword: z.context.keyword,
    cate: z.context.catid,
    city: z.context.city,
    state: z.context.state,
    utilities: z.context.utilities,
    page: z.context.page != undefined ? z.context.page: 1,
    cid: z.context.curID,
    zoom: z.context.zoom,
    center: z.context.center,
    lstPoint: z.context.lstPoint,
    searchType: z.context.searchType,
    isSearchForm: z.context.searchType == searchTypeEnum.SearchForm,
    isPageLoad: true
  };

  setTimeout(function () {
      $this._SearchAction(I)
    },
    500)
};

MapSearchControler.prototype.geolocateUser = function (z) {
  $this = this;
  if (typeof navigator.geolocation !== "undefined") {

    navigator.geolocation.getCurrentPosition(function (k)
    {
      var e = [];
      var d = 13 ;
      e.lat = k.coords.latitude;
      e.lng = k.coords.longitude;

      $this.vnTMaps.ChangeMapByGeolocate(e, d) ;
      $this.vnTMaps.DeleteShape();

      $this.vnTMaps.polyline = null;
      $this.vnTMaps.IsShowDetail = false;
      $this.vnTMaps.isShowUtil = false;


      var b = {
        keyword: z.context.keyword,
        cate: z.context.catid,
        city: z.context.city,
        state: z.context.state,
        utilities: z.context.utilities,
        page: z.context.page != undefined ? z.context.page: 1,
        lstPoint: z.context.lstPoint,
        searchType: z.context.searchType,
        isSearchForm: z.context.searchType == searchTypeEnum.SearchForm,
        isPageLoad: true
      };

      $this._SearchAction(b) ;

      return true ;

    }, function (e) {})

  }




};

MapSearchControler.prototype.ChangeMapPostition = function (a) {
  var d = 10;
  var e = "Việt Nam";
  var c = false ;
  if ( $("#state").val() != '' ) {
    d = 14;

    var f =  $("#state :selected").text() + ', '+ $("#city :selected").text();
    e = f + ", " + e;
    c = true

  }else if (  $("#city").val() != '' ) {
    d = 12;
    var f = $("#city :selected").text();
    e = f + ", " + e;
    c = true
  } else {
    e = "Hồ Chí Minh, Việt Nam" ;
  }
  if (a.isPageLoad) a.zoom = d;
  this.vnTMaps.ChangeMapByAddress(e, d) ;
  this.vnTMaps.DeleteShape();

  return c ;
};

MapSearchControler.prototype.InitializeSearch = function (z) {
  $this = this ;
  $('#boxMapSearch #btnSearch').bind('click', this, function (a) {
    $this.SearchSubmitForm(z);
  });

  $('#boxMapSearch input[name="cat_id"]').bind('change', this, function (a) {

        $this.SearchSubmitForm(z);

  });

  $('#boxMapSearch #brand').bind('change', this, function (a) {
    $this.SearchSubmitForm(z);
  });
  $('#boxMapSearch #city').bind('change', this, function (a) {
    $this.SearchSubmitForm(z);
  });
  $('#boxMapSearch #state').bind('change', this, function (a) {
    $this.SearchSubmitForm(z);
  });

};

MapSearchControler.prototype.SearchSubmitForm = function (z) {

  var b = {
    keyword: z.context.keyword,
    cate: z.context.catid,
    brand: z.context.brand,
    city: z.context.city,
    state: z.context.state,
    utilities: z.context.utilities,
    page: z.context.page != undefined ? z.context.page: 1,
    cid: z.context.curID,
    zoom: z.context.zoom,
    center: z.context.center,
    lstPoint: z.context.lstPoint,
    searchType: z.context.searchType,
    isSearchForm: z.context.searchType == searchTypeEnum.SearchForm,
    isPageLoad: true
  };

  b.page = 1;

  b.keyword = $("#key_search").val() ;

  b.cate =$("input[name='cat_id']:checked").val() ;

  b.brand =$("#brand").val() ;

  //dia diem
  b.city = $("#city").val() ;
  b.state = $("#state").val() ;

  var c = this.ChangeMapPostition(b);

  this.vnTMaps.polyline = null;
  this.vnTMaps.IsShowDetail = false;
  this.vnTMaps.isShowUtil = false;
  this._SearchAction(b) ;
};

MapSearchControler.prototype.SearchSubmitFormByShape = function (a, b, c, d, e, f) {

  if (this.lstPoint != null && this.lstPoint.length > 0) {
    //this.mapTitle.html('');
    var g = {};
    if (a != undefined) {
      g.page = a
    } else {
      g.page = 1
    }

    g.keyword = $("#keyword").val() ;
    g.cate =$("input[name='cat_id']:checked").val();
    //dia diem
    g.city = $("#city").val() ;
    g.state = $("#state").val() ;


    g.lstPoint = this.lstPoint;
    g.isSearchForm = false;
    g.isPageLoad = false;
    g.minlat = b;
    g.minlong = c;
    g.maxlat = d;
    g.maxlong = e;
    g.m = "shape";
    if (f != undefined) {
      g.cid = f.cid;
      g.zoom = f.zoom;
      g.center = f.center
    } else {
      g.zoom = $thismap.getZoom();
      g.center = $thismap.getCenter()
    }
    this._SearchAction(g)
  }
};

MapSearchControler.prototype.SearchSubmitFormByBounds = function (a, b, c, d, e, f) {

  if (this.lstPoint != null && this.lstPoint.length > 0) {
    //this.mapTitle.html('');
    var g = {};
    if (a != undefined) {
      g.page = a
    } else {
      g.page = 1
    }

    g.keyword = $("#keyword").val() ;
    g.cate =$("input[name='cat_id']:checked").val() ;
    //dia diem
    g.city = $("#city").val() ;
    g.state = $("#state").val() ;

    g.minlat = b;
    g.minlong = c;
    g.maxlat = d;
    g.maxlong = e;
    g.isSearchForm = false;
    g.isPageLoad = false;
    g.m = "bounds";
    if (f != undefined) {
      g.cid = f.cid;
      g.zoom = f.zoom;
      g.center = f.center
    } else {
      g.zoom = $thismap.getZoom();
      g.center = $thismap.getCenter()
    }
    this._SearchAction(g)
  }
};

MapSearchControler.prototype._SearchAction = function (d) {



  if (d.zoom != '' && d.zoom < minZoomAllowSearch) {
    this.itemView.html('<div class="notify-info">Hãy phóng to bản đồ để tìm kiếm.</div>');
    return
  }
  this.viewMap.block(loadingHtml);

  $("#viewList").show();
  $("#directions").hide();
  if(this.vnTMaps.isShowDirections) {
    this.vnTMaps.callBackClearDirections();
  }

  d.sort = 0;
  d.v = new Date().getTime();
  d.my_lat = this.vnTMaps.myLatLng.lat;
  d.my_lon = this.vnTMaps.myLatLng.lng;

  this.searchVar = d;
  var f = this;

  //getAjaxMethod = POST
  $.ajax({
    url: 'index.php?route=information/maps',
    data: this.searchVar,
    type: "POST",
    xhrFields: {
      withCredentials: true
    },
    success: function (a) {
      if (a == null) {
        f.viewMap.unblock();
        return
      }


      //a = eval("(" + a + ")");

      f.tempItemData = f.itemData = f.vnTMaps.showMap(a.data, d.isSearchForm);


      $("#map_num").html(a.total);

      f.ChagePageIndex(0);
      if (a.total == 0) {
        f.pageView.html('');
      }

      f.viewMap.unblock();

    },
    error: function (a, b, c) {
      f.viewMap.unblock()
    },
    complete: function () {

    }
  });

  if (d.isSearchForm || d.isPageLoad) {
      //load du lieu sau khi load xong
  }
};

MapSearchControler.prototype._FilterAction = function () {
  if (this.itemData.length <= 1) return;
  var d = [];
  d = this.itemData ;
  this.tempItemData = d;
  this.ChagePageIndex(0)
};

MapSearchControler.prototype.ChangeUrlForNewContext = function () {
  var a = "&cat=" + (this.searchVar.cate != undefined ? this.searchVar.cate: '');
  a += "&brand=" + (this.searchVar.brand != undefined ? this.searchVar.brand: 0);
  a += "&city=" + (this.searchVar.city != undefined ? this.searchVar.city: 0);
  a += "&state=" + (this.searchVar.state != undefined ? this.searchVar.state: 0);
  a += "&keyword=" + (this.searchVar.keyword != undefined ? this.searchVar.keyword: '');
  a += "&points=" + (this.vnTMaps.isDrawing ? (this.searchVar.lstPoint != undefined ? this.searchVar.lstPoint: '') : '');
  a += "&zoom=" + this.vnTMaps.getZoom();
  a += "&center=" + this.vnTMaps.getCenter();
  a += "&page=" + this.searchVar.page;
  a += "&itemID=" + (this.vnTMaps.curID != undefined && this.vnTMaps.curID != null ? this.vnTMaps.curID: '');
  a += "&searchtype=" + (this.searchVar.isSearchForm ? 0 : 1);
  window.location.href = window.location.pathname + '#' + a
};

MapSearchControler.prototype.ChagePageIndex = function (a) {
  if (this.tempItemData.length == 0) {
    this.itemView.html('');
    return
  }
  var b = 500; //pagesize
  var c = this.tempItemData.length / b;
  c = Math.ceil(c);
  /*if (a == 0) {
    this.itemView.html('')
  }
  */
  this.itemView.html('') ;
  if (c < 1) return;
  if (a + 1 > c) return;
  this.currPageIndex = a;

  var d = a * b;
  if (d <= 0) d = 0;
  var e = d + b;
  var f = this;



  this.BuildListView(f,d,e,this.tempItemData);

  $('.item-view .detail-item').live('click', function () {
    f.vnTMaps.showInfoWindow($(this).attr('rel'));
    $(this).parent().find('.detail-item-current').removeClass('detail-item-current');
    $(this).addClass('detail-item-current')
  });

  this.pageView.html(this.BuildPaging(this.tempItemData.length, b, a));
};



MapSearchControler.prototype.BuildPaging = function (total, pagesize, currpage)  {
  var navigation = "";
  var pmore = 3;
  var cPage = currpage + 1 ;
  var totalPages = total / pagesize;
  totalPages = Math.ceil(totalPages);

  var objectLink = 'myControlerObj.ChagePageIndex(';


  // get total pages
  var next_page = pmore;
  var prev_page = pmore;
  if (cPage < pmore) next_page = pmore + pmore - cPage;
  if (totalPages - cPage < pmore) prev_page = pmore + pmore - (totalPages - cPage);

  if (totalPages > 1)
  {
    navigation = "<ul>";
    // Show first page
    if (cPage > (pmore + 1))
    {
      pLink = objectLink  +  "0)";
      navigation += '<li><a href="javascript:void(0)" onclick="'+ pLink +'"   ><i class="fa fa-angle-double-left"></i></a></li>';
    }
    // End
    // Show Prev page
    if (cPage > 1)
    {
      numpage = cPage - 1;
      pLink = objectLink  +  "" + (numpage -1) + ")";
      navigation += '<li><a href="javascript:void(0)" onclick="'+ pLink +'"  ><i class="fa fa-angle-left"></i></a></li>';
    }
    // End
    // Left
    for (i = prev_page; i >= 0; i --)
    {
      pagenum = cPage - i;
      if ((pagenum > 0) && (pagenum < cPage))
      {
        pLink = objectLink  +  "" + (pagenum-1) + ")";
        navigation += '<li><a href="javascript:void(0)" onclick="'+ pLink +'" >' + pagenum + '</a></li>';

      }
    }
    // End
    // Current
    navigation += '<li><span class="pagecur">' + cPage + '</span></li>';
    // End
    // Right
    for (i = 1; i <= next_page; i ++)
    {
      pagenum = cPage + i;
      if ((pagenum > cPage) && (pagenum <= totalPages))
      {
        pLink = objectLink  +  "" + (pagenum-1) + ")";
        navigation += '<li><a href="javascript:void(0)" onclick="'+ pLink +'" >' + pagenum + '</a></li>';
      }
    }
    // End
    // Show Next page
    if (cPage < totalPages)
    {
      numpage = cPage + 1;
      pLink = objectLink  +  "" + (numpage-1) + ")";
      navigation += '<li><a href="javascript:void(0)" onclick="'+ pLink +'"  ><i class="fa fa-angle-right"></i></a></li>';
    }
    // End
    // Show Last page
    if (cPage < (totalPages - pmore))
    {
      pLink = objectLink  + "" + (totalPages-1) + ")";
      navigation += '<li><a href="javascript:void(0)" onclick="'+ pLink +'"  ><i class="fa fa-angle-double-right"></i></a></li>';
    }

    navigation += '</ul>';
    // End
  }

  return navigation ;

};

MapSearchControler.prototype.BuildItemDetail = function (a, b, c) {

  var e = '';
  e += '<div  id="item_' + a.id + '" class="item" rel="' + a.id + '"  zindex="1" >';
  //e += '<div class="i-images"><img src="' + a.picture + '" /></div>';
  e += '<div class="i-description">';
  e += '<div class="name"><h3>' + a.title + '</h3></div>';
  e += '<div class="address"><i class="fa fa-home" aria-hidden="true"></i> ' + a.address + '</div>';
  e += '<div class="telephone"><i class="fa fa-phone" aria-hidden="true"></i> ' + a.telephone + ' <i class="fa fa-envelope-o" aria-hidden="true"></i> ' + a.fax + '</div>';

  //e += '<div class="comment"><i class="fa fa-globe" aria-hidden="true"></i> ' + a.comment + '</div>';
  if(a.distance)
  {
    e += '<div class="distance">' + a.distance + '</div>';
  }

  if(a.time_open)
  {
    e += '<div class="time_open"><span class="open">GIỜ MỞ CỬA:</span><span>' + a.time_open + '</span></div>';
  }

  e += '</div>';
  e += '<div class="clear"></div>';
  e += '</div>';

  if (!c) {
  }
  return e ;
};

MapSearchControler.prototype.BuildListView = function ( f, d, e, data)  {


  var items = [];
  var arr_cat= [];
  var arr_cat_ck= [0];
  var cur_cat = 0 ; var j=0;
  for (var i = d; i < e && i < data.length; i++) {
    //if( $.inArray( data[i].cat_id , arr_cat_ck ) != -1){
    if(arr_cat_ck.indexOf(data[i].cat_id) === -1   ){
      arr_cat_ck.push(data[i].cat_id);
      cur_cat = data[i].cat_id ;

      arr_cat[arr_cat.length] = {cat_id : data[i].cat_id , cat_name: data[i].cat_name  }   ;
      cur_cat = data[i].cat_id ;

      items[cur_cat] = new Array();
      j=0;
    }

    items[cur_cat][j] = data[i] ;
    j++;
  }
  //console.log(arr_cat);
  var html=''; var list_item='';
  $.each(arr_cat, function(idx, info_cat) {
    if(info_cat.cat_id>0){
      class_open ='';
      if(idx==0) class_open = ' open';
      list_item='';

      if(items[info_cat.cat_id].length>0){
        $.each(items[info_cat.cat_id], function(idx, item) {
          list_item += f.BuildItemDetail(item, 0, 0);
        });
      }

      html += '<div class="group-items'+class_open+'">' ;
      //html += '<div class="group-name"><span>'+info_cat.cat_name+'</span></div>';
      html += '<div class="group-list">'+list_item+'</div>';
      html += '</div>' ;

    }
  });

  f.itemView.html(html);



  $(".group-items .group-name").click(function(){
    if(! $(this).parent().hasClass("open")){
      $(this).parent().parent().find(".group-items.open").stop().removeClass('open');

      $(this).parent().addClass("open");
      //$(this).parent().find(".group-list").stop().slideToggle(700);
    }else{
      $(this).parent().removeClass("open");
    }
  });


  var h = $(".group-list .item") ;
  h.click(function () {
    f.vnTMaps.hideTipWindow($(this).attr('rel'), parseInt($(this).attr('zindex')));
    f.vnTMaps.showInfoWindow($(this).attr('rel'));
    $(this).parent().find('.detail-item-current').removeClass('detail-item-current');
    $(this).addClass('detail-item-current')
  });
  h.hover(function () {
      f.vnTMaps.showTipWindow($(this).attr('rel'))
    },
    function () {
      f.vnTMaps.hideTipWindow($(this).attr('rel'), parseInt($(this).attr('zindex')))
    })





};

MapSearchControler.prototype.callBackDrawEvent = function (a, b, c, d, e, f) {

  this.lstPoint = e;
  if (this.vnTMaps.isDrawing) {
    this.SearchSubmitFormByShape(1, b, d, a, c, f)
  } else {
    this.SearchSubmitFormByBounds(1, b, d, a, c, f)
  }

};

MapSearchControler.prototype.callBackClearPointEvent = function (a) {

  this.itemView.html('');
  this.pageView.html('');
  this.lstPoint = '';
  this.vnTMaps.isMapIdle = true ;

};

MapSearchControler.prototype.callBackSearchPlace = function (b, c, d) {
  var e = d[0].short_name;
  var f = '';
  for (var a = 0; a < d.length; a++) {
    for (var i = 0; i < d[a].types.length; i++) {
      if (d[a].types[i] == 'route' && f.length == 0) {
        f = 'route';
        break
      } else if (d[a].types[i] == 'sublocality' && f.length == 0) {
        f = 'sublocality';
        break
      } else if (d[a].types[i] == 'administrative_area_level_2' && f.length == 0) {
        f = 'administrative_area_level_2';
        break
      } else if (d[a].types[i] == 'administrative_area_level_1' && f.length == 0) {
        f = 'administrative_area_level_1';
        break
      } else if (d[a].types[i] == 'neighborhood' && f.length == 0) {
        f = 'neighborhood';
        break
      }
    }
    if (f.length > 0) break
  }
  if (f.length == 0) f = 'unknow';
  $this._SearchAction({
    page: 1,
    lat: b,
    lon: c,
    level: f,
    address: e
  })
};


MapSearchControler.prototype.ShowDirections = function (id) {

  $("#viewList").hide();
  $("#directions").show();
  $("#routes").html('');

  this.vnTMaps.DirectionsView(id) ;

};
