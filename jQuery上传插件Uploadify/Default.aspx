<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="jqUploadify._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="scripts/uploadify.css" rel="stylesheet" type="text/css" />
    <link href="scripts/default.css" rel="stylesheet" type="text/css" />

    <script src="scripts/jquery-1.7.2.min.js" type="text/javascript"></script>

    <script src="scripts/swfobject.js" type="text/javascript"></script>

    <script src="scripts/jquery.uploadify.min.js" type="text/javascript"></script>

    <script type="text/javascript">
    $(function(){
        $("#file_upload").uploadify({
            //开启调试
            'debug' : false,
            //是否自动上传
            'auto':false,
            'buttonText':'选择照片',
            //flash
            'swf': "scripts/uploadify.swf",
            //文件选择后的容器ID
            'queueID':'uploadfileQueue',
            'uploader':'scripts/upload.ashx',
            'width':'75',
            'height':'24',
            'multi':false,
            'fileTypeDesc':'支持的格式：',
            'fileTypeExts':'*.jpg;*.jpge;*.gif;*.png',
            'fileSizeLimit':'1MB',
            'removeTimeout':1,

            //返回一个错误，选择文件的时候触发
            'onSelectError':function(file, errorCode, errorMsg){
                switch(errorCode) {
                    case -100:
                        alert("上传的文件数量已经超出系统限制的"+$('#file_upload').uploadify('settings','queueSizeLimit')+"个文件！");
                        break;
                    case -110:
                        alert("文件 ["+file.name+"] 大小超出系统限制的"+$('#file_upload').uploadify('settings','fileSizeLimit')+"大小！");
                        break;
                    case -120:
                        alert("文件 ["+file.name+"] 大小异常！");
                        break;
                    case -130:
                        alert("文件 ["+file.name+"] 类型不正确！");
                        break;
                }
            },
            //检测FLASH失败调用
            'onFallback':function(){
                alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
            },
            //上传到服务器，服务器返回相应信息到data里
            'onUploadSuccess':function(file, data, response){
                //alert(data);
            }
        });
    });

    function doUplaod(){
        $('#file_upload').uploadify('upload','*');
    }

    function closeLoad(){
        $('#file_upload').uploadify('cancel','*');
    }


    </script>

</head>
<body>
    <table width="704" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
        <tr>
            <td align="center" valign="middle">
                <div id="uploadfileQueue" style="padding: 3px;">
                </div>
                <div id="file_upload">
                </div>
            </td>
        </tr>
        <tr>
            <td height="50" align="center" valign="middle">
                <img alt="" src="images/BeginUpload.gif" width="77" height="23" onclick="doUplaod()" style="cursor: hand" />
                <img alt="" src="images/CancelUpload.gif" width="77" height="23" onclick="closeLoad()" style="cursor: hand" />
            </td>
        </tr>
    </table>
	<center>
  <span style="font-size:15px; font-weight:bold; text-align:center; line-height:25px; color:#000; width:100%">jQuery上传插件Uploadify 3.2在.NET下的详细例子<br />
  <a href="http://www.jq-school.com" target="_blank" style="color:#000">JquerySchool</a>网站出品（<a href="http://www.jq-school.com" style="color:#000" target="_blank">http://www.jq-school.com</a>） <br />
   <a href="http://api.jq-school.com/" target="_blank" style="color:#000">在线API帮助文档</a> <br />
  <a target="_blank" href="http://wp.qq.com/wpa/qunwpa?idkey=6fcb83942dc3630777ae7745bd5093a1a5917f915f4e95cfc498633379ebfbb4">官方网站学习交流QQ群<img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" style="width:90px; height:22px;" alt="Jquery学堂QQ⑤群" width="90" height="22" title="Jquery学堂QQ⑤群"></a></span>
</center>
</body>
</html>
