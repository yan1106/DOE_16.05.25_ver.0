﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DOE_yes.aspx.cs" Inherits="DOE_yes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="..\css\styles.css" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<!-- <script src="http://code.jquery.com/jquery-1.8.3.js"></script> -->
<script src="../JS/jquery.bgiframe-2.1.2.js" type="text/javascript"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<!-- 
<script src="../JS/jquery-ui-1.9.2/jquery-1.10.0.min.js" type="text/javascript"></script>    
<script src="../JS/jquery-ui-1.9.2/jquery-ui.min.js" type="text/javascript"></script>
<link href="../JS/jquery-ui-1.9.2/jquery-ui.css" rel="stylesheet" type="text/css" />  
    -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>DOE_yes</title>
     <style type="text/css">

.font8
	{color:blue;
	font-size:20.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:細明體, monospace;
	}
.font6
	{color:blue;
	font-size:20.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	}
        .style-doe-head{
            width:300px;
            height:50px;

        }
        .style-doe-head-2{
            width:500px;
            height:50px;

        }
        .style-doe-head-blue
        {
            width:1000px;
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
           
            
            background: #538ED5;
        }
        .style-doe-head-gray
        {
           
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
           
            
            background: #7F7F7F;
        }
        
        .style-doe-head-orange
        {
            width:400px;
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            /*padding-left: 2px;
            padding-right: 2px;
            padding-top: 2px;
            padding-bottom: 2px;*/
            
            background: #FFC000;
        }
         .auto-style1 {
             width: 1000px;
         }
        p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	         margin-left: 0cm;
             margin-right: 0cm;
             margin-top: 0cm;
         }
         </style>
        
    <script type="text/javascript">
     
        var test_array = new Array();
        var array_count = 0;
        var but_save_id = new Array();
        var but_save_str = new Array(); //存放button數量      
        var but_save_row = new Array();//save每個button在第幾row
        var but_save_rowspan = new Array();
        var but_classname = new Array();



        var array_stage = new Array;  //DOE_information資料陣列
        var array_SpeChar = new Array;
        var array_md = new Array;
        var array_cate = new Array;
        var array_kp = new Array;
        var rowspan = 0;
        var row_count = 0;
        
       


      
        function display_array()
        {
            alert(testArray);
        }

      
                                                
        function createtable(count) {
            
            var but_id_savecount = new Array();
            var table_obj = document.getElementById('doe_1');
            var row = document.getElementById('row_2').rowIndex;
            var table_title_leng = document.getElementById('doe_1').rows.length;
            var c = 0;
            //document.getElementById('a1').textContent = table_title_leng;

            for (i = table_title_leng; i < count + table_title_leng ; i++) {

                var r = document.getElementById('doe_1').insertRow(i)
                
                r.id = "row_" + i;
                for (j = 0; j < 19; j++) {

                    var col = r.insertCell(j);
                    col.id = r.id + "_" + "col_" + j;
                    if (c < count) {
                        if (j == 0) {
                            col.innerHTML = array_stage[c];
                        }
                        if (j == 1)
                            col.innerHTML = array_SpeChar[c];
                        if (j == 2)
                            col.innerHTML = array_md[c];
                        if (j == 3)
                            col.innerHTML = array_cate[c];
                        if (j == 4)
                            col.innerHTML = array_kp[c];
                    }
                    if (j == 5) {
                        var y = 1;
                        var btn = document.createElement("INPUT");
                        btn.type = "button";
                        btn.id = "but_" + i + "_" + j;
                        //but_save_str[i - table_title_leng] = btn.id;
                        but_save_id[c]=btn.id; //計算but被按得次數
                        btn.value = "+"
                        
                        btn.addEventListener('click', function () { Add_Row(this) });
                         document.getElementById(r.id + "_" + "col_" + j).appendChild(btn);
                    }
                    if (j == 6) {

                        /*var btn = document.createElement("INPUT");
                        btn.type = "button";
                        btn.id = "but_" + i + "_" + j;
                        btn.value = "-"
                        btn.addEventListener('click', function () { DeleteRow(this) });
                         document.getElementById(r.id + "_" + "col_" + j).appendChild(btn);*/
                    }
                    if(j>6&&j<19)
                    {
                        if (j == 8) {
                            var legs = document.getElementById(r.id + "_" + "col_" + j);
                            legs.innerHTML = "±";
                        }
                        else {
                            var text = document.createElement("INPUT");
                            text.type = "text";
                            text.id = "text_" + i + "_" + j;
                            text.value = text.id;
                           
                            document.getElementById(r.id + "_" + "col_" + j).appendChild(text);
                            document.getElementById("text_" + i + "_" + j).style.width = "70%";
                        }
                    }


                    
                }
                c++;//計算資料數
            }
           
        }
        
        function jude_but_id(but,obj)
        {
            
            for(i=0;i<but.length;i++)
            {
                if(but[i] == obj.id)
                {
                    alert(but[obj.id]++);
                }
            }
        }



        function Add_Row(row)
        {
            
            var obj = event.srcElement;//抓取是哪一個button動作
            row_num = row.parentNode.parentNode.rowIndex;
            row_num_berfore = row_num - 1;
            row_count = row_num + 1;
            rowspan_nun = row_num;
            
            
            //var dis = (++but_save_str[obj.id]);
            //alert(obj.id+"~~~~"+row_num);
            
            //document.getElementById('a1').textContent = row_count;
            //document.getElementById('a2').textContent = dis;
           
          
            

            var r = document.getElementById("doe_1").insertRow(row_count)
            r.id = "row_" + (row_count);
            document.getElementById(obj.id).style.visibility = "hidden";

            

            
            
            for (i = 0; i < but_save_id.length; i++) {
                var row_ber = document.getElementById(but_save_id[i]).parentNode.parentNode.rowIndex;

                but_save_row[i] = row_ber;
                but_classname[i] = i;
            }
            
           
            
                
            for(i=0;i<14;i++)
            {

                var temp_group;
                


                for (j = 0; j < but_save_row.length; j++) {

                    if (row_num >= but_save_row[j] && row_num < but_save_row[j + 1]) {
                        
                        temp_group = "group_" + but_save_row[j] + "_";
                        //break;
                    
                    }
                    else if (row_num >= but_save_row[but_save_row.length - 1] && j == (but_save_row.length - 1)) {
                        temp_group = "group_" + but_save_row[j] + "_";
                        //break;
                    }


                }


                var col = r.insertCell(i);
                col.id = temp_group + r.id + "_" + "col_" + i;


               

                if (i == 0)
                {

                    var btn = document.createElement("INPUT");
                    btn.type = "button";
                    btn.id = temp_group + "but_" + row_count + "_" + i;
                    //alert(obj.id);
                    //but_save_str[btn.id]
                    //but_save_str[obj.id];
                    btn.value = "+"
                    btn.addEventListener('click', function () { Add_Row(this) });
                    document.getElementById(col.id).appendChild(btn);

                   

                }
                else if(i==1)
                {
                   

                        var btn = document.createElement("INPUT");
                        btn.type = "button";
                        btn.id = temp_group + "but_" + row_count + "_" + i;
                        //alert(obj.id);
                        //but_save_str[btn.id]
                        //but_save_str[obj.id];
                        btn.value = "-"
                        btn.addEventListener('click', function () { DeleteRow(this) });
                        document.getElementById(col.id).appendChild(btn);
                    
                }
    

                else {
                    col.innerHTML = col.id;
                }



               
            }
           

            for (i = 0; i < but_save_id.length; i++) {
                var row_ber = document.getElementById(but_save_id[i]).parentNode.parentNode.rowIndex;

                but_save_row[i] = row_ber;
                but_classname[i] = i;
            }

            for (i = 0; i < but_save_row.length; i++) {
                

                


                if (row_num >= but_save_row[i] && row_num < but_save_row[i + 1]) {
                    r.className = but_classname[i];
                    var rowspan = (document.getElementsByClassName(but_classname[i]).length + 1);
                    but_save_rowspan[i] = rowspan;
                    document.getElementById('a1').textContent = rowspan;

                    if (rowspan - 1 != 1) //隱藏刪除按鈕
                    {

                       
                        var str = obj.id;
                        var temp_str = str.split('_');

                        str = temp_str[0] + "_" + temp_str[1] + "_" + temp_str[2] + "_" + temp_str[3] + "_" + 1;
                      
                        document.getElementById(str).style.visibility = "hidden";
                    }



                    var rowspan_0 = document.getElementById('doe_1').rows[but_save_row[i]].cells[0].rowSpan = but_save_rowspan[i];
                    var rowspan_1 = document.getElementById('doe_1').rows[but_save_row[i]].cells[1].rowSpan = but_save_rowspan[i];
                    var rowspan_2 = document.getElementById('doe_1').rows[but_save_row[i]].cells[2].rowSpan = but_save_rowspan[i];
                    var rowspan_4 = document.getElementById('doe_1').rows[but_save_row[i]].cells[3].rowSpan = but_save_rowspan[i];
                    var rowspan_5 = document.getElementById('doe_1').rows[but_save_row[i]].cells[4].rowSpan = but_save_rowspan[i];

                }
                else if (row_num >= but_save_row[but_save_row.length - 1] && i == (but_save_row.length - 1)) {
                    r.className = but_classname[i];
                    var rowspan = (document.getElementsByClassName(but_classname[i]).length + 1);
                    but_save_rowspan[i] = rowspan;
                    document.getElementById('a1').textContent = rowspan;

                    if (rowspan - 1 != 1) //隱藏刪除按鈕
                    {
                        var str = obj.id;
                        var temp_str = str.split('_');

                        str = temp_str[0] + "_" + temp_str[1] + "_" + temp_str[2] + "_" + temp_str[3] + "_" + 1;

                        document.getElementById(str).style.visibility = "hidden";



                    }

                    var rowspan_0 = document.getElementById('doe_1').rows[but_save_row[i]].cells[0].rowSpan = but_save_rowspan[i];
                    var rowspan_1 = document.getElementById('doe_1').rows[but_save_row[i]].cells[1].rowSpan = but_save_rowspan[i];
                    var rowspan_2 = document.getElementById('doe_1').rows[but_save_row[i]].cells[2].rowSpan = but_save_rowspan[i];
                    var rowspan_4 = document.getElementById('doe_1').rows[but_save_row[i]].cells[3].rowSpan = but_save_rowspan[i];
                    var rowspan_5 = document.getElementById('doe_1').rows[but_save_row[i]].cells[4].rowSpan = but_save_rowspan[i];
                }
                

            }


           


        }

        function DeleteRow(point)
        {
            var obj = event.srcElement;//抓取是哪一個button動作
            row_num = point.parentNode.parentNode.rowIndex;
            var row_num_bef = document.getElementById('doe_1').rows[row_num - 1];
            
            var temp_group;

            
           



            for (i = 0; i < but_save_row.length; i++) {
                

               


                if (row_num >= but_save_row[i] && row_num < but_save_row[i + 1]) {
                    
                    var test = (--but_save_rowspan[i]);
                    document.getElementById('a1').textContent = test;
                                                    
                    var cell_0 = document.getElementById('doe_1').rows[row_num - 1].cells[0].children[0].id;
                    var cell_1 = document.getElementById('doe_1').rows[row_num - 1].cells[1].children[0].id;
                    

                    document.getElementById(cell_0).style.visibility = "visible";                                    
                    document.getElementById(cell_1).style.visibility = "visible";


                    var rowspan_0 = document.getElementById('doe_1').rows[but_save_row[i]].cells[0].rowSpan = but_save_rowspan[i];
                    var rowspan_1 = document.getElementById('doe_1').rows[but_save_row[i]].cells[1].rowSpan = but_save_rowspan[i];
                    var rowspan_2 = document.getElementById('doe_1').rows[but_save_row[i]].cells[2].rowSpan = but_save_rowspan[i];
                    var rowspan_4 = document.getElementById('doe_1').rows[but_save_row[i]].cells[3].rowSpan = but_save_rowspan[i];
                    var rowspan_5 = document.getElementById('doe_1').rows[but_save_row[i]].cells[4].rowSpan = but_save_rowspan[i];

                }
                else if (row_num >= but_save_row[but_save_row.length - 1] && i == (but_save_row.length - 1)) {
                   
                    //var rowspan = (document.getElementsByClassName(but_classname[i]).length + 1);
                    var test = (--but_save_rowspan[i]);
                    document.getElementById('a1').textContent = test;

                    var cell_0 = document.getElementById('doe_1').rows[row_num - 1].cells[0].children[0].id; //抓取上一列新增button_id
                    var cell_1 = document.getElementById('doe_1').rows[row_num - 1].cells[1].children[0].id; //抓取上一列刪除button_id
                    document.getElementById(cell_0).style.visibility = "visible";
                    document.getElementById(cell_1).style.visibility = "visible";
                   

                    var rowspan_0 = document.getElementById('doe_1').rows[but_save_row[i]].cells[0].rowSpan = but_save_rowspan[i];
                    var rowspan_1 = document.getElementById('doe_1').rows[but_save_row[i]].cells[1].rowSpan = but_save_rowspan[i];
                    var rowspan_2 = document.getElementById('doe_1').rows[but_save_row[i]].cells[2].rowSpan = but_save_rowspan[i];
                    var rowspan_4 = document.getElementById('doe_1').rows[but_save_row[i]].cells[3].rowSpan = but_save_rowspan[i];
                    var rowspan_5 = document.getElementById('doe_1').rows[but_save_row[i]].cells[4].rowSpan = but_save_rowspan[i];
                }


            }

            document.getElementById("doe_1").deleteRow(row_num);



        }






            // set the destination textbox value with the ContactName
            function CallSuccess(res, destCtrl) {
                var dest = document.getElementById(destCtrl);
                dest.value = res;
            }

            // alert message on some failure
            function CallFailed(res, destCtrl) {
                alert(res.get_message());
            }
        
   </script>
</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <div id="div1">
     <fieldset style="width:95%;" class="fieldset">
    <legend class="legend" style="font-weight: 700; font-size: large;">DOE yes</legend>   
       
            <!--border-collapse:collapse,要讓欄位邊框合併-->
            <table id="doe_1" border="1" style="border-color:black;width:100%;height:50%;border-collapse:collapse;">
                 <tr id ="head1">
                     <td class="style-doe-head-blue" style="width:600px;" rowspan="2" >                     
                        <div>Effect Stage</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2" >                     
                        <div>Special Characteristics</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2">
                      <div id="a1"></div>
                      <div>Methodology</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2">
                      <div id="a2"></div>
                      <div>Category</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2">                    
                      <div>Keyparameter</div>
                     </td>
                        
                     <td class="style-doe-head-gray" style="width:400px;border-right-style:none;" rowspan="2" colspan="5">
                         <div id="show_len"></div>
                        <div>DOE LEGS</div>
                     </td>
                     <td class="style-doe-head-gray" style="width:550px;" rowspan="2" >
                         <div style="font-size:20px;">Wafer Qn'ty</div>
                     </td>                  
                     <td class="style-doe-head-orange" colspan="3">
                         <div>Wafer Count</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Atrribute</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Note</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Lot Number</div>
                     </td>
                     <td class="style-doe-head-orange" style="width:900px;" rowspan="2">
                         <div style="font-size:15pt">Due date</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                          <div style="font-size:15pt">Result</div>
                     </td>                                      
                </tr>
                <tr>
                    <td style="width:100px; height:50px" class="style-doe-head-orange">
                        <div>DM</div>
                    </td>
                     <td style="width:100px;" class="style-doe-head-orange">
                         <div>PC</div>
                     </td>
                     <td style="width:100px;" class="style-doe-head-orange">
                         <div>Live</div>
                     </td>                                                                                               
                </tr>
                <tr id="row_2">
                    <td ><div>PR STRIP</div></td>
                     <td class="auto-style1" ><div>Process time</div></td>
                     <td>&nbsp;</td>  
                           
                                       
                     
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td  style="border-top-style:solid;border-left-style:solid;border-bottom-style:solid; ">330</td>
                     <td  style="border-top-style:solid;border-left-style:solid;border-bottom-style:solid; ">±</td>                                                                   
                     <td style="border-top-style:solid;border-left-style:solid;border-bottom-style:solid; ">10%</td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                       
                     <td id="but3_doe">
                         <!--
                         <input type="button" id="but1" value="create"  /> -->           
                     </td>
                    <td><!--<input type="button" id ="but2" value="test" onclick="createtable(row_count)" />--></td>
                    <td></td>                                    
                </tr>
                
                
              
               
                
              
                
                
              
            </table>
            </fieldset>
        </div>
          
         
         <div></div>
        
         
         
         
         
         
         
         
         
         
               
    </form>
</body>
</html>
