/*global $*/
$(document).ready(function(){$(function(){$(".sub-menu-body").hide();for(var t=1;4>=t;t++)$.cookie("menu")=="menu"+t&&$("#menu"+t).show();$(".sub-menu-head").on("click",function(){$(this).next(".sub-menu-body").slideToggle();var t=new Date;t.setTime(t.getTime()+18e5),$.cookie("menu",$(this).next(".sub-menu-body").attr("id"),{expires:t}),$(".sub-menu-body").not($(this).next(".sub-menu-body")).slideUp()})}),$(function(){$(".tag-edit").on("click",function(){$(this).parents(".tag-flag").next(".tag-edit-form").slideToggle(),$(".tag-edit-form").not($(this).parents(".tag-flag").next(".tag-edit-form")).slideUp()})}),$(function(){$(".list-edit").on("click",function(){$(this).parents(".list-flag").next(".list-edit-form").slideToggle(),$(".list-edit-form").not($(this).parents(".list-flag").next(".list-edit-form")).slideUp()})}),$(function(){$(".tng-edit").on("click",function(){$(this).parents(".tng-main").nextAll(".tng-edit-form").slideToggle(),$(".tng-edit-form").not($(this).parents(".tng-main").nextAll(".tng-edit-form")).slideUp()})}),$(function(){$(".search-btn").on("click",function(){"none"!=$(".search-form").css("display")?($(".search-tngs").css("height","79vh"),$(".search-form").slideToggle()):($(".search-tngs").css("height",$(".search-tngs").outerHeight()-$(".search-form").outerHeight()-2+"px"),$(".search-form").slideToggle())})}),$(".list-p").hide(),$(".list-down").on("click",function(){$(this).parents(".list-p-flag").nextAll(".list-p").slideToggle(650),$(".list-p").not($(this).parents(".list-p-flag").next(".list-p")).slideUp(650)}),$(".nav-cube").on("click",function(){"block"==$(".tng-form-p").css("display")?$.when($(".tng-form-p").fadeOut(200)).done(function(){$(".tng-form-p-b").fadeOut(100)}):$.when($(".tng-form-p-b").fadeIn(100)).done(function(){$(".tng-form-p").fadeIn(300)})}),$(".load-flag").fadeOut()});