<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>직원 공지사항</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
body {
    display: flex;
    margin: 0;
    height: 100vh;
}

.sidebar-container {
    flex-shrink: 0;
    width: 250px;
    background-color: #f8f9fa;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    overflow-y: auto;
}


.annContent,.list-title{
	    margin-left: 100px;
    margin-right: 100px;
} 
.ann-list-no.ann-notice {
    color: red; /* 빨간색으로 설정 */
    font-weight: bold; /* 굵게 설정 */
    /* 여기에 추가적인 스타일링을 할 수 있습니다. */
}

.pagination {
    margin-top: 10px;
    margin-bottom: 10px;
    display: flex;
    justify-content: center;
}

.commonstext {
    flex-grow: 1;
    padding: 20px;
    overflow-y: auto;
    margin-top: 100px;
    text-align: center;
}

.search-container {
    display: inline-block;
    border: 2px solid #6076E8;
    border-radius: 8px;
    padding: 5px 40px;
    margin: 10px;
    background-color: #f8f9fa;
}

input[type="text"].freetextbox {
    border: 2px solid #6076E8; 
    border-radius: 4px; 
    padding: 3px; 
    font-size: 14px; 
    color: #333;
    outline: none; 
    width: 30vh;
    margin-right: 15px;
}

input[type="text"].freetextbox:focus {
    border-color: #4056A1;
}

button {
    background-color: #6076E8; 
    border: none; 
    color: white; 
    padding: 5px 10px;
    text-align: center; 
    text-decoration: none; 
    display: inline-block; 
    font-size: 14px; 
    margin: 4px 2px;
    cursor: pointer; 
    border-radius: 4px;
    transition-duration: 0.2s;
}

button:hover {
    background-color: #4056A1;
}

.list-title, .ann-list {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 10px 0;
}

.empann-list_no, .empann-list_subject, .empann-list_check, .empann-list_bHit {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.ann-list-no {
flex-basis: 80px;
    margin-right: -80px;
    text-align: center;
}

.ann-list-no.ann-notice {
    color: red; /* 공지사항 텍스트 색상 설정 */
    font-weight: bold; /* 공지사항 텍스트 굵게 설정 */
}

.empann-list_subject {
    flex-grow: 1;
    margin: 0 10px;
}

.empann-list_check {
    flex-basis: 100px;
    margin: 0 10px;
}

.empann-list_bHit {
    flex-basis: 100px;
    margin: 0 10px;
}
.ann-list-check {
    flex-basis: 100px; /* 예시로 너비를 설정 */
    display: flex; /* 체크박스와 텍스트를 수평 정렬 */
    align-items: center; /* 세로 정렬 설정 */
    margin: 0 10px; /* 필요한 여백 설정 */
}

.freecheckbox {
    margin-left: 5px; /* 체크박스와 텍스트 사이 여백 설정 */
}


.freecheckbox {
    margin-left: 10px;
}
</style>
</head>
<body>
<div class="sidebar-container">
    <jsp:include page="../sideBar.jsp"></jsp:include>
</div>

<div class="commonstext">
    <div class="title">
        <h2>- 직원 공지사항 -</h2>
    </div>
    <div class="search-container">
        <input type="text" class="freetextbox" id="freetextbox" placeholder=" 제목을 입력해주세요.">
        <button id="freebutton">검색</button>
    </div>
    <span class="nav-right">
        <button id="writebutton" onclick="writeAnn()">글쓰기</button>
        <button id="deletebutton" style="margin-left: 10px;">삭제</button>
    </span>
    
    <hr>
    <div class="annContent">
        <div class="list-title"style="margin-left:20px;">
            <div class="list-no"><strong>번호</strong></div>
            <div class="list-subject"><strong>제목</strong></div>
            <div class="list-check"><strong>선택</strong></div>
            <div class="list-hit"><strong>조회수</strong></div>
        </div>
    </div>
    <hr>
    <div id="list" style="    margin-left: 100px;
    margin-right: 100px;"></div>
    
    <div class="pagination">
        <nav aria-label="Page navigation" style="text-align:center">
            <ul class="pagination" id="pagination"></ul>
        </nav>
    </div>
    <hr>
</div>
<hr>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<script>
var showPage = 1;
var ann_fixed = 'N';

$(document).ready(function(){
    listCall(1);

    $('#freebutton').on('click', function() {
        var searchText = $('#freetextbox').val();
        if (searchText.trim() !== '') {
            search(searchText, showPage);
        } else {
            listCall(showPage);
        }
    });

    function search(title, page) {
        $.ajax({
            type: 'GET',
            url: '/empann/search.ajax',
            data: {
                'textval': title,
                'page': page.toString()
            },
            dataType: 'json',
            success: function(data) {
                drawList(data.list);
            },
            error: function(error) {
                console.log('검색 실패:', error);
            }
        });
    }
    
    function initializePagination(totalPages, category) {
        $('#pagination').twbsPagination({
            totalPages: totalPages, // 전체 페이지 수
            visiblePages: 5, // 보여줄 페이지 수
            onPageClick: function(event, page) { 
                console.log('페이지 클릭 이벤트 발생:', page);
                listCall(page, category); // 페이지 클릭 시 해당 페이지의 데이터를 호출하는 함수 호출
            }
        });
    }
    

    function listCall(page) {
        var cnt = 10;
        $.ajax({
            type: 'GET',
            url: '/empann/annList.ajax',
            data: {
                'page': page,
                'cnt': cnt,
                'ann_division': 'E',
                'ann_fixed': ann_fixed
            },
            dataType: 'json',
            success: function(data) {
                drawList(data.list);
                initializePagination(data.totalPages);
            },
            error: function(error) {
                console.log('리스트 출력 실패:', error);
            }
        });
    }

    function drawList(data) {
        var content = '';  
        data.sort(function(a, b) {
            if (a.ann_fixed === 'Y' && b.ann_fixed === 'Y') {
                return b.ann_no - a.ann_no; // 둘 다 공지일 경우 ann_no 내림차순 정렬
            } else if (a.ann_fixed === 'Y') {
                return -1; // a가 공지면 우선순위로
            } else if (b.ann_fixed === 'Y') {
                return 1; // b가 공지면 우선순위로
            } else {
                return b.ann_no - a.ann_no; // 그 외에는 ann_no 내림차순 정렬
            }
        });
        for (var i = 0; i < data.length; i++) {
            content += '<div class="ann-list">';
            if (data[i].ann_fixed === 'Y') {
                content += '<div class="ann-list-no ann-notice">[공지]</div>'; // 공지 여부에 따라 클래스 추가
            } else {
                content += '<div class="ann-list-no">' + data[i].ann_no + '</div>';
            }
            content += '<div class="ann-list-subject"><a href="/empannDetail.go?empann_no=' + data[i].ann_no + '">' + data[i].ann_subject + '</a></div>';
            content += '<div class="ann-list-check"><input type="checkbox" class="freecheckbox" id="checkbox_' + data[i].ann_no + '"></div>';
            content += '<div class="ann-list-hit">' + data[i].ann_bHit + '</div>';
            content += '</div>';
        }
        $('#list').html(content);
    }

    function initializePagination(totalPages) {
        $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 5,
            onPageClick: function(event, page) {
                listCall(page);
            }
        });
    }

    $('#deletebutton').click(function() {
        var checkedItems = $('.freecheckbox:checked');
        var annNos = [];

        checkedItems.each(function() {
            var annNo = $(this).attr('id').split('_')[1];
            annNos.push(parseInt(annNo));
        });

        if (annNos.length > 0) {
            $.ajax({
                type: 'POST',
                url: '/ann/deleteAnn.ajax',
                contentType: 'application/json',
                data: JSON.stringify(annNos),
                success: function(response) {
                    console.log('삭제 성공:', response);
                    alert('삭제에 성공하였습니다.');
                    listCall(1);
                },
                error: function(error) {
                    console.log('삭제 실패:', error);
                    alert('삭제 중 오류가 발생했습니다.');
                }
            });
        } else {
            alert('삭제할 공지사항을 선택해주세요.');
        }
    });

    $('#writebutton').click(function() {
        window.location.href = '/empannwrite.go';
    });
});
</script>
</body>
</html>
