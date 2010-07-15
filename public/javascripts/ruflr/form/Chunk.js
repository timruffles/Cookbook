dojo.provide("ruflr.form.Chunk");
dojo.require('dijit._Widget');
dojo.require('dijit._Templated');
dojo.require('dojox.validate.web');
dojo.require('dojo.NodeList-fx');
(function(d,$) {
	
	dojo.declare("ruflr.form.Chunk", [dijit._Widget, dijit._Templated],{
	  templateString:  dojo.cache("ruflr.form", "Chunk.html"),
	  widgetsInTemplate:false,
	
		contentTypes:['Text','Video','Image','Audio'],
		contentType:null,
		submitUrl:null,
		
		startup:function() {
			var self = this;
			this.contentTypes.forEach(function(type) {
				var button = d.create('button',{innerHTML:type},self.contentTypeButtons);
			});
			$('button',this.contentTypeButtons).onclick(dojo.hitch(this,this._contentButtonHandler));
			d.connect(this.attachBtn,'click',dojo.hitch(this,this._attachHandler));
			['_contentButtonHandler','_attachHandler'].forEach(function(func){
				d.connect(self,func,d.hitch(self,self._clearMessages));
			});
		},
		
		_contentButtonHandler:function(evt) {
			evt.preventDefault();
			this.contentType = evt.target.innerHTML;
			$(this.urlInput).fadeIn().play();
		},
		_attachHandler:function(evt) {
			evt.preventDefault();
			if(dojox.validate.isUrl(d.attr(this.url,'value'))) {
				d.xhrPost({
					url:this.submitUrl,
					form:this.form
				})
				.addCallback(d.hitch(this,this._submitted))
				.addErrback(d.hitch(this,function(){
						this._error('Opps, there was a problem saving your content');
				}));
			} else {
				this._error('Please enter a valid url');
			}
		},
		_submitted:function() {
			this._notice('Your upload was successfully created');
		},
		_notice:function(msg) {
			this._setMessage(this.noticeDisplay,this.errorDisplay,msg);
		},
		_error:function(msg) {
			this._setMessage(this.errorDisplay,this.noticeDisplay,msg);
		},
		_setMessage:function(node,hideNode,msg) {
				$(hideNode).fadeOut({
					onEnd:function() {
						$(hideNode).style({display:'none'});
						$(node).style({display:'block'});
						node.innerHTML = msg;
						$(node).fadeIn({duration:100}).play();
					},
					duration:100
				}).play();
		}
		
		
	});
	
})(dojo,dojo.query);


