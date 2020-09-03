@echo off & title Í¼Æ¬ÅúÁ¿ÐÞ¼ô 3840x3840 (µ¥¶À) By Sengoku v1.0
cd "%~dp1"
magick "%~nx1" -crop 3840x3840 "%~n1.jpg"

