dojo.provide("ruflr.form.TriCheckBox");
dojo.require('dijit.form.Button');
dojo.declare("ruflr.form.TriCheckBox", dijit.form.Button,{
	
	templateString: dojo.cache("ruflr.form", "CheckBox.html"),

	baseClass: "dijitTriCheckBox",
	
	
	values: null,

	postMixInProperties: function(){
		if(this.value == ""){
			this.value = "on";
		}

		// Need to set initial checked state as part of template, so that form submit works.
		// dojo.attr(node, "checked", bool) doesn't work on IEuntil node has been attached
		// to <body>, see #8666
		this.checkedAttrSetting = this.checked ? "checked" : "";

		this.inherited(arguments);
	},

	_onClick: function(/*Event*/ e){
		// summary:
		//		Internal function to handle click actions - need to check
		//		readOnly, since button no longer does that check.
		if(this.readOnly){
			return false;
		}
		return this.inherited(arguments);
	},
	
	_setValueAttr: function(/*String or Boolean*/ newValue, /*Boolean*/ priorityChange){
		// summary:
		//		Handler for value= attribute to constructor, and also calls to
		//		attr('value', val).
		// description:
		//		During initialization, just saves as attribute to the <input type=checkbox>.
		//
		//		After initialization,
		//		when passed a boolean, controls whether or not the CheckBox is checked.
		//		If passed a string, changes the value attribute of the CheckBox (the one
		//		specified as "value" when the CheckBox was constructed (ex: <input
		//		dojoType="dijit.CheckBox" value="chicken">)
		if(typeof newValue == "string"){
			this.value = newValue;
			dojo.attr(this.focusNode, 'value', newValue);
			newValue = true;
		}
		if(this._created){
			this.set('checked', newValue, priorityChange);
		}
	},
	_getValueAttr: function(){
		// summary:
		//		Hook so attr('value') works.
		// description:
		//		If the CheckBox is checked, returns the value attribute.
		//		Otherwise returns false.
		return (this.checked ? this.value : false);
	}
});