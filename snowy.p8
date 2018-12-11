pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- snowy game
-- by pokolo

-- init function
function _init()
	w=128
	h=128
	f=false
	speed=1
	d=4
	m=false
	player = {x=60,y=60,sp=1,w=8,h=8}
		-- collide with map tiles?
	player.cm=true
	-- collide with world bounds?
	player.cw=true
end
-- update function
function _update()
	m=false
	-- movement
	move(player)
	if m then
 	walking()
 else
 	player.sp=1
 end
end

function cmap(o)
	local ct=false
	local cb=false

	-- if colliding with map tiles
	if(o.cm) then
		local x1=o.x/8
		local y1=o.y/8
		local x2=(o.x+7)/8
		local y2=(o.y+7)/8
 	local a=fget(mget(x1,y1),0)
 	local b=fget(mget(x1,y2),0)
 	local c=fget(mget(x2,y2),0)
 	local d=fget(mget(x2,y1),0)
 	ct=a or b or c or d
 end
 -- if colliding world bounds
 if(o.cw) then
 	cb=(o.x<0 or o.x+8>w or
						o.y<0 or o.y+8>h)
 end

 return ct or cb
 
end
function move(o)
 local lx=o.x -- last x
 local ly=o.y -- last y

 if(btn(0)) o.x-=1 f=false m=true
 if(btn(1)) o.x+=1 f=true	m=true
 if(btn(2)) o.y-=1
 if(btn(3)) o.y+=1

 -- collision, move back
 if(cmap(o)) o.x=lx o.y=ly
 
end
-- player animation
function walking()
	d=d-1
	if d<0 then
		player.sp=player.sp+1
		if player.sp>2 then player.sp=1 end
		d=4
	end
end
-- draw function
function _draw()
	cls()
	map(0,0)
	spr(player.sp,player.x,player.y,1,1,f)	
end


__gfx__
00000000000000000000000077777777777777777777776677777777dddddddd0000000000000000000000000000000000000000000000000000000000000000
00000000000000000055550076677777777777777777777677777777dddddddd0000000000000000000000000000000000000000000000000000000000000000
0070070000555500005ff56076777777777777777777777777777777dddddddd0000000000000000000000000000000000000000000000000000000000000000
00077000065ff560061f1f6077777777777777777777777777777777dddddddd00aaaa0000000000000000000000000000000000000000000000000000000000
00077000061f1f6006ffff6077777777777777777777777777777777dddddddd0a9997a000000000000000000000000000000000000000000000000000000000
0070070005ffff600566665077777777777777777777777777777777dddddddd0a9999a000000000000000000000000000000000000000000000000000000000
00000000006666500066660077777777777777767777777777777777dddddddd0a9999a000000000000000000000000000000000000000000000000000000000
00000000005005000050050077777777777777667777777777777777dddddddd00aaaa0000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060
__gff__
0000000000000001000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0606060606060606060606060606060909090909090906060606060606060606060606060606060606060606060606060606060609090909090606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060909060606090906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060906060606060906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060506060606060603070606060906060606060906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060706060906060606060906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060306060606060706060906060606060906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060906060606060906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060906040606060906060606060606060606060606060606030606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606030606060606060606060306060909060606060906060606060606040606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060603060606060606060909060606060904060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060909060606060906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060707060606060606060606060909060606060906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606050706060909060606060906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060607070706060909060606060906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606040606060606060606060606060909060606060906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0909090909090909090909090909090909090909090906060606030606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0909090909090909090909090606060606060606090906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0909090909090909090909090909090909090909090906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0909090909090909090909090909090909090909090909090906060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606030606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606060606060606030606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060406060606060606060606060606060606060606060606060606060606060606060604060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606
__sfx__
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001100000f0500d0500f0500d0500f0500d0500f0500f050160500d050160500f0501605016050140501405024050000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 01424344

