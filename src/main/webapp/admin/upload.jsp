<!DOCTYPE html>
<html>
  <head>
    <title>upload.html</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

  </head>
  
  <body>
		<form action="../upload.do" method="post" enctype="multipart/form-data">
			<input type="file" name="files" vlaue="上传文件"/>
			<input name="file1" id="file1" size="40" type="file"/>  
			文件2：<input name="file2" id="file2" size="40" type="file"/>  
			文件3：<input name="file3" id="file3" size="40" type="file"/> 
			<input type="submit" value="提交">
		</form>
  </body>
</html>
