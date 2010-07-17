dojo.provide("ruflr.form.ChunkList");
dojo.require("ruflr.form.Chunk");
dojo.require('dojo.NodeList-fx');

(function(dojo,$) {
dojo.declare("ruflr.form.ChunkList", [dijit._Widget, dijit._Templated],{
    templatePath: dojo.moduleUrl("ruflr","form/ChunkList.html"),
    widgetsInTemplate:false,
		chunkFired:true,
		startup:function() {
			this.set('chunkFired',false);
			var self = this;
			$(this.addBtn).onclick(function(){
				// don't want to add new chunks to the list until they've done their thing
				if(self.get('chunkFired') == false) return;
				self.set('chunkFired',false)
				self.addChunk();
			});
			this.addChunk();
		},
		addChunk: function() {
			var self = this;
			var chunk = new ruflr.form.Chunk({});
			d.place(chunk.containerNode,self.instructions,'last');
			d.connect(chunk,'onSave',function(){
				self.set('chunkFired',true);
			});
			chunk.startup();
		},
		_setChunkFiredAttr:function(fired) {
			this.chunkFired = fired;
			$(this.addBtn).attr('disabled',fired ? false : 'disabled');
		},
		_getChunkFiredAttr:function() {
			return this.chunkFired;
		},
});
})(dojo,dojo.query);