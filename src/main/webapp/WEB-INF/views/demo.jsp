<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>演示：treeview+bootstrap多级下拉树插件 - 素材火http://www.sucaihuo.com/</title>

        <link href="http://libs.useso.com/js/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            .sucaihuo-header{margin-bottom: 15px;font-family: "Segoe UI", "Lucida Grande", Helvetica, Arial, "Microsoft YaHei", FreeSans, Arimo, "Droid Sans", "wenquanyi micro hei", "Hiragino Sans GB", "Hiragino Sans GB W3", "FontAwesome", sans-serif;}
            .sucaihuo-icon{color: #fff;}
        </style>
        <!--[if IE]>
                <script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="sucaihuo-container">
            <div class="container">
                <div class="row">
                    <hr>
                    <h2>演示十四：可多选树菜单</h2>
                    <div class="col-sm-4">
                        <h2>Input</h2>
                        <div class="form-group">
                            <label for="input-check-node" class="sr-only">Search Tree:</label>
                            <input type="input" class="form-control" id="input-check-node" placeholder="Identify node..." value="Parent 1">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" class="checkbox" id="chk-check-silent" value="false">
                                Silent (No events)
                            </label>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-6">
                                <button type="button" class="btn btn-success check-node" id="btn-check-node">选中节点</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-danger check-node" id="btn-uncheck-node">取消选中节点</button>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-primary check-node" id="btn-toggle-checked">切换节点</button>
                        </div>
                        <hr>
                        <div class="form-group row">
                            <div class="col-sm-6">
                                <button type="button" class="btn btn-success" id="btn-check-all">选中所有节点</button>
                            </div>
                        </div>
                        <button type="button" class="btn btn-danger" id="btn-uncheck-all">取消选中所有节点</button>
                    </div>
                    <div class="col-sm-4">
                        <h2>Tree</h2>
                        <div id="treeview-checkable"></div>
                    </div>
                </div>
                <br/>
                <br/>
                <br/>
                <br/>
            </div>
        </div>

        <script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script> 
  		<script src="bootstrap/js/bootstrap-treeview.js"></script> 
        <script type="text/javascript">

            $(function() {

                var defaultData = [
                    {
                        text: 'Parent 1',
                        href: '#parent1',
                        tags: ['4'],
                        nodes: [
                            {
                                text: 'Child 1',
                                href: '#child1',
                                tags: ['2'],
                                nodes: [
                                    {
                                        text: 'Grandchild 1',
                                        href: '#grandchild1',
                                        tags: ['0']
                                    },
                                    {
                                        text: 'Grandchild 2',
                                        href: '#grandchild2',
                                        tags: ['0']
                                    }
                                ]
                            },
                            {
                                text: 'Child 2',
                                href: '#child2',
                                tags: ['0']
                            }
                        ]
                    },
                    {
                        text: 'Parent 2',
                        href: '#parent2',
                        tags: ['0']
                    },
                    {
                        text: 'Parent 3',
                        href: '#parent3',
                        tags: ['0']
                    },
                    {
                        text: 'Parent 4',
                        href: '#parent4',
                        tags: ['0']
                    },
                    {
                        text: 'Parent 5',
                        href: '#parent5',
                        tags: ['0']
                    }
                ];


                var json = '[' +
                        '{' +
                        '"text": "Parent 1",' +
                        '"nodes": [' +
                        '{' +
                        '"text": "Child 1",' +
                        '"nodes": [' +
                        '{' +
                        '"text": "Grandchild 1"' +
                        '},' +
                        '{' +
                        '"text": "Grandchild 2"' +
                        '}' +
                        ']' +
                        '},' +
                        '{' +
                        '"text": "Child 2"' +
                        '}' +
                        ']' +
                        '},' +
                        '{' +
                        '"text": "Parent 2"' +
                        '},' +
                        '{' +
                        '"text": "Parent 3"' +
                        '},' +
                        '{' +
                        '"text": "Parent 4"' +
                        '},' +
                        '{' +
                        '"text": "Parent 5"' +
                        '}' +
                        ']';


                var $checkableTree = $('#treeview-checkable').treeview({
                    data: defaultData,
                    showIcon: false,
                    showCheckbox: true,
                    onNodeChecked: function(event, node) {
                        $('#checkable-output').prepend('<p>' + node.text + ' was checked</p>');
                    },
                    onNodeUnchecked: function(event, node) {
                        $('#checkable-output').prepend('<p>' + node.text + ' was unchecked</p>');
                    }
                });

               
            });
        </script>
    </body>
</html>


<!-- 以下是统计及其他信息，与演示无关，不必理会 -->

<p class="vad">
    <a href="http://www.sucaihuo.com/" target="_blank">sucaihuo.com</a>
    <a href="http://www.sucaihuo.com/js/660.html" target="_blank">说 明</a>
    <a href="http://www.sucaihuo.com/js/660.html" target="_blank">下 载</a>
</p>
<style type="text/css">
    .vad { margin: 120px 0 5px; font-family: Consolas,arial,宋体,sans-serif; text-align:center;}
    .vad a { display: inline-block; height: 36px; line-height: 36px; margin: 0 5px; padding: 0 50px; font-size: 14px; text-align:center; color:#eee; text-decoration: none; background-color: #222;}
    .vad a:hover { color: #fff; background-color: #000;}
    .thead { width: 728px; height: 90px; margin: 0 auto; border-bottom: 40px solid #fff;}
</style>
<div style="width:728px;margin:0 auto">
    <script type="text/javascript">
        /*700*90 创建于 2015-06-27*/
        var cpro_id = "u2176575";
    </script>
    <script src="http://cpro.baidustatic.com/cpro/ui/c.js" type="text/javascript"></script>
</div>
