
echo 安装为服务后台自动运行
echo 选中，右键，作为管理员运行

nssm stop MH_Tunnel
nssm remove MH_Tunnel confirm

rem nssm install MH_Tunnel %cd%/mh_tunnel.exe 
rem nssm set MH_Tunnel AppDirectory %cd%
rem nssm start MH_Tunnel

pause



