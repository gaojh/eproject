$(function() {
	$.fn.page = function(option){
		var page = "";
		if (option == null) {
			page = page + "<ul class=\"pagination\"><li><a href=\"#\">&laquo;</a></li><li><a href=\"#\">&raquo;</a></li></ul>";
		}else{
			var current = option.pageNumber + 1;

			var paginationSize = option.paginationSize;
			if (option.paginationSize == null || option.paginationSize == "") {
				paginationSize = 5;
			}

			var pageSize = option.pageSize;
			if (option.pageSize == null || option.pageSize == "") {
				pageSize = 20;
			}

			var begin = Math.max(1, current - Math.floor(paginationSize / 2));
			var end = Math.min(begin + (paginationSize - 1), option.totalPages);
			page = page + "<ul class=\"pagination\"><li><a href=\"javascript:" + option.fun + "(" + 1 + "," + pageSize + ")\">&laquo;</a></li>";
			for (i = begin; i <= end; i++) {
				if (i == option.pageNumber) {
					page = page + "<li class=\"active\"><span>" + i + "<span class=\"sr-only\">(current)</span></span></a></li>";
				} else {
					page = page + "<li><a href=\"javascript:" + option.fun + "(" + i + "," + pageSize + ")\">" + i + "</a></li>";
				}
			}
			page = page + "<li><a href=\"javascript:" + option.fun + "(" + option.totalPages + "," + pageSize + ")\">&raquo;</a></li></ul>";
		}
		this.html(page);
	};
});