Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1,
		"d+" : this.getDate(),
		"h+" : this.getHours(),
		"m+" : this.getMinutes(),
		"s+" : this.getSeconds(),
		"q+" : Math.floor((this.getMonth() + 3) / 3),
		"S" : this.getMilliseconds()
	}
	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
}


String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}

function getFormatDateByLong(l, pattern) {
	return getFormatDate(new Date(l), pattern);
}

function getFormatDate(date, pattern) {
	if (date == undefined) {
		date = new Date();
	}
	if (pattern == undefined) {
		pattern = "yyyy-MM-dd hh:mm:ss";
	}
	return date.format(pattern);
}

function loadUrl(url) {
	$("#content").empty();
	$("#content").load(url);
}

function createTableBody(data, options) {
	var columns = options.columns;
	var checkbox = options.checkbox;
	var deleteOption = options.deleteOption;
	var body = "";
	$.each(data, function(i, val) {
		body = body + "<tr>";
		if (checkbox) {
			body = body + "<td>" + "<input type=\"checkbox\" name=\""
					+ options.checkboxName + "\" value=" + val.id + ">"
					+ "</td>";
		}
		for (var index = 0; index < columns.length; index++) {
			var colName = columns[index];
			body = body + "<td>" + val[colName] + "</td>";
		}
		if (deleteOption) {
			var paramNames = options.deleteParamNames;
			var params = [];
			debugger;
			for (var index = 0; index < paramNames.length; index++) {
				var name = paramNames[index];
				params.push(val[name]);
			}
			var paramValues = params.join(",");
			body = body + "<td>" + "<a href=\"javascript:"
					+ options.deleteFunction + "(" + paramValues
					+ ")\">删除</a></td>"
		}
		body = body + "</tr>";
	});
	return body;
}

function createCrumb(title,path){
	return "<a href=\"${ctx}/"+path+"\">"+title+"</a>";
}