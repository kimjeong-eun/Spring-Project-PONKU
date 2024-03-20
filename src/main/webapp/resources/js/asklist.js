console.log("asklist 스크립트 실행")

var askListService = (function() {

	function getListWithPaging(param, callback, error) {

		var page = param.page || 1;

		$.getJSON("/ask/main/" + page + ".json",
			function(data) {
				if (callback) {
					callback(data); // 댓글 목록을 가져온다.
				}
			}).fail(function(xhr, status, err) {
				if (error) {
					error();
				}
			});
	}

	return {
		getListWithPaging : getListWithPaging,
	};










})();