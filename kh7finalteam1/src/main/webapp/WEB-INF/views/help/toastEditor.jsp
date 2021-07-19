<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head lang="en">
    <meta charset="UTF-8">
    <title>1. 설치와 기본기능 사용</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css">
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/2.0.0/toastui-editor.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
    <script>
    	$(function(){
    		/*$("#insertDB").click(function(e){
    			console.log("cc");
    			
   				$("#category").val($("#temp-category").val()); 
    			$("#title").val($("#temp-title").val());
    			$("#content").val("")
    			e.preventDefault();
    			
    			var con = `<div class="accordion" id="accordionExample">
    				  <div class="accordion-item">
    		    <h2 class="accordion-header" id="headingOne">
    		      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
    		        Accordion Item #1
    		      </button>
    		    </h2>
    		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
    		      <div class="accordion-body">
    		        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
    		      </div>
    		    </div>
    		  </div>
    		  <div class="accordion-item">
    		    <h2 class="accordion-header" id="headingTwo">
    		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
    		        Accordion Item #2
    		      </button>
    		    </h2>
    		    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
    		      <div class="accordion-body">
    		        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
    		      </div>
    		    </div>
    		  </div>
    		  <div class="accordion-item">
    		    <h2 class="accordion-header" id="headingThree">
    		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
    		        Accordion Item #3
    		      </button>
    		    </h2>
    		    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
    		      <div class="accordion-body">
    		        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
    		      </div>
    		    </div>
    		  </div>
    		</div>`
    			$("#content").val(con); 
    		});*/
    	});
    </script>
</head>
<body>
    <div class="tui-doc-description">
        <h3>Toast UI Editor 2.0.0 Test</h3>
        <h2>설치와 기본기능 사용</h2>
    </div>
    	<input type="number" id="temp-category" >
		<input type="text" id="temp-title" placeholder="제목 입력란">
        <div class="editor" style="box-sizing: border-box; height: 500px;"></div>
	<br>
	<form action="editor" method="post">
		<input type="number" name="categoryNo" id="category">
		<input type="text" name="title" id="title">
		<!-- <input type="text" name="content" id="content"> -->
		<textarea name="content" id="content"></textarea>
		
    	<input type="submit" id="insertDB" value="↓↓↓ 불러서 넣기 ↓↓↓">
    </form>
    <br>

        <div id="viewer"></div>
  
    <script src="https://uicdn.toast.com/editor/2.0.0/toastui-editor-all.min.js"></script>

    <script>

        /* eslint-disable no-unused-vars */
        var content = [].join('\n');

        var editor = new toastui.Editor({
            el: document.querySelector('.editor'),
            previewStyle: 'vertical',
            initialEditType: "wysiwyg",
            height: '500px',
            initialValue: content,
            plugins: toastui.plugin
        });

        var viewer = toastui.Editor.factory({
            el: document.querySelector('#viewer'),
            viewer: true,
            height: '500px',
            initialValue: content
        }); 
        
        $(function(){
        	viewer.on("change", function(){
        		console.log("change");
        	});
        	
        	$("#insertDB").click(function(e){
    			//<button>123</button>
    			viewer.setMarkdown(editor.getMarkdown());
    			//viewer.setContent(editor.getHtml());
    			//viewer.setHtml(editor.getMarkdown());
    			//$("#viewer").html(editor.getHtml());
    			viewer.markdownValue = "hi";
    			console.log(editor.getMarkdown());
    			console.log(viewer);
    			e.preventDefault();
   			});
        	
        	
        });
        
    </script>


</body></html>