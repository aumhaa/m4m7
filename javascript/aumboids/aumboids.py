import random
import math

def debug(*a):
	maxObject.post(' '.join(str(item) for item in a))


def introspect(obj):
	debug('introspect:', obj)
	for item in dir(obj):
		not item.startswith('__') and debug('---', item, getattr(obj, item))


def test():
	for boid in boids:
		atts = [str(att) + ' : ' + str(getattr(boid, att)) for att in dir(boid) if not att.startswith('__')]
		debug(atts)


def set_att(number, att, val):
	debug('set att', number, att, val)
	if len(boids) >= number:
		boid = boids[number]
		if hasattr(boid, att):
			debug('hasattr...')
			setattr(boid, att, val)


def init(v = 8):
	debug('init', v)
	agentcount(v)



"""for obj in dir(maxObject):
	try:
		debug(obj, getattr(maxObject, obj))
	except:
		debug(obj)"""


timer = 0
modes = [[0 for x in range(4)] for y in range(8)]
notes = [0, 5, 7, 10, 12, 17, 19, 24]
durations = [8000, 4000, 2000, 1000]
dist_array = []
boids = []
weights = [1., 1., 1., 1., 1., 1., 1., 1.]
sixteenth = 1./16
centroid_x = 0.
centroid_y = 0.
avgvelocity_x = 0.
avgvelocity_y = 0.
myprime = 0
primes = range(128)
mywind_x = 0.
mywind_y = 0.
myseparation = .1
myalignment = .07
mycoherence = .1
myobedience = .5
myinertia = .5
myfriction = .5
mysepthresh = .3
mymaxvel = .1
mygravity = .1
mygravpoint_x = .5
mygravpoint_y = 0.
myslip = 0.
mywind = 0.


class Boid(object):


	def __init__(self, num):
		super(Boid, self).__init__()
		self.num = num
		self.x = random.random()
		self.y = random.random()
		self.vx = (random.random()-.5)*.1
		self.vy = (random.random()-.5)*.1
		self.px = 0
		self.py = 0
		self.prime = num
		self.order = num
		self.speed = 1.
		self.tonality = 1.
		self.size = 1.
		self.attraction = 1.
		self.gravity = 1.
		self.weight = 1.
		self.dist = 0
		self._next_x = 0
		self._next_y = 0
	

class Gameboard(object):


	def __init__(self):
		super(Gameboard, self).__init__()
		self.myagentcount = 0
		self.leader = 0
		self.modes = [[0 for x in range(4)] for y in range(8)]
		self.notes = [0, 5, 7, 10, 12, 17, 19, 24]
		self.durations = [8000, 4000, 2000, 1000]
		self.dist_array = []
		self.boids = []
		self.weights = [1, 1, 1, 1, 1, 1, 1, 1]
		self.sixteenth = 1/16
		self.centroid_x = 0
		self.centroid_y = 0
		self.avgvelocity_x = 0
		self.avgvelocity_y = 0
		self.myprime = 0
		self.primes = range(128)
		self.mywind_x = 0
		self.mywind_y = 0
		self.myseparation = .1
		self.myalignment = .07
		self.mycoherence = .1
		self.myobedience = .5
		self.myinertia = .5
		self.myfriction = .5
		self.mysepthresh = .3
		self.mymaxvel = .1
		self.mygravity = .1
		self.mygravpoint_x = .5
		self.mygravpoint_y = 0
		self.myslip = 0
		self.mywind = 0
	


gb = Gameboard()

def agentcount(v):
	#gb.myagentcount = clip(v,1,8);
	debug('agentcount', v)
	gb.myagentcount = v
	gb.dist_array = []
	gb.boids = []
	for num in range(v):
		gb.dist_array.append(0)
		gb.boids.append(Boid(num))
		gb.boids[num].rulecount = 5
	gb.leader = gb.boids[0]
	debug('new count is:', v, 'leader is:', gb.leader)


agentcount(8)


def tick(agent):
	px = agent.px
	py = agent.py
	
	separate(agent)
	align(agent)
	cohere(agent)
	gravitate(agent)
	follow(agent)
	
	#inertia
	agent.vx = px*gb.myinertia + agent.vx*(1.-gb.myinertia)
	agent.vy = py*gb.myinertia + agent.vy*(1.-gb.myinertia)
	
	#velocity limit
	agent.vx = clip(agent.vx, -gb.mymaxvel, gb.mymaxvel)
	agent.vy = clip(agent.vy, -gb.mymaxvel, gb.mymaxvel)
	
	#update position based on velocity and friction
	agent.x += agent.vx*(1.-gb.myfriction)
	agent.y += agent.vy*(1.-gb.myfriction)
	
	#slip(this);
	wrap(agent) #torus space
	#bounce(this);


def leader_in(v):
	debug('leader in', len(gb.boids), v)
	bl = len(gb.boids)
	if bl and bl >= v:
		gb.leader = gb.boids[v]


def prime(v):
	myprime = v


def wind(v):
	mywind = v


def separation(v):
	myseparation = clip(v, 0, 1)*.1


def alignment(v):
	myalignment = clip(v, 0, 1)*.1


def coherence(v):
	mycoherence = clip(v, 0, 1)*.1


def friction(v):
	myfriction = clip(v, 0, 1)*.1


def inertia(v):
	myinertia = clip(v, 0, 1)*.1


def septhresh(v):
	mysepthresh = clip(v, 0, 1)*.1


def maxvel(v):
	mymaxvel = clip(v, 0, 1)*.1


def gravity(v):
	mygravity = clip(v, 0, 1)*.1


def gravpoint(x, y):
	grav_x = mygravpoint_x*15
	grav_y = mygravpoint_y*15
	maxObject.outlet(3,  (grav_x, grav_y, 0))
	mygravpoint_x = clip(x, 0., 1.)
	mygravpoint_y = clip(y, 0., 1.)
	grav_x = mygravpoint_x*15
	grav_y = mygravpoint_y*15
	maxObject.outlet(3,  (grav_x, grav_y, 20))


def bang():
	#timer += 1
	#mywind_x = ((random.random()-.5)*.05)*mywind_x
	#mywind_y = ((random.random()-.5)*.05)*mywind_y
	#circle()
	#for agent in boids:
	#    maxObject.outlet(3, round(agent.x*15), round(agent.y*15), 0)
	maxObject.outlet(3, "clear")
	maxObject.outlet(3, (mygravpoint_x*15, mygravpoint_y*15, 20))
	#introspect(gb.leader)
	lead()
	
	cx = 0
	cy = 0
	cvx = 0
	cvy = 0
	
	for agent in gb.boids:
		tick(agent)
		
		#calculate current frames average position/velocity
		cx += agent.x
		cy += agent.y
		cvx += agent.vx
		cvy += agent.vy
	gb.centroid_x = cx/gb.myagentcount
	gb.centroid_y = cy/gb.myagentcount
	gb.avgvelocity_x = cvx/gb.myagentcount
	gb.avgvelocity_y = cvy/gb.myagentcount
	#maxObject.outlet(2, 'bang')
	#maxObject.outlet(1, (centroid_x, centroid_y, avgvelocity_x, avgvelocity_y))
	
	for agent in gb.boids:
		order = agent.order
		number = agent.num
		maxObject.outlet(3, (round(agent.x*15), round(agent.y*15), (1 if number==gb.leader.num else 0)+(1 if order<4 else 0)+1))
		if order< 4:
			maxObject.outlet(4, (number, notes[gb.leader.num] + modes[number][order], 120 - (order*30), durations[order], agent.weight))
		else:
			maxObject.outlet(4, (number, 'off'))
		maxObject.outlet(5, (number, agent.dist))
		#maxObject.outlet(0, (agent.x, agent.y, agent.vx, agent.vy))


def circle():
	phase = int(floor((timer%64.)/16.))
	if phase is 0:
		mygravpoint_x += sixteenth
	elif phase is 1:
		mygravpoint_y += sixteenth
	elif phase is 2:
		mygravpoint_x -= sixteenth
	elif phase is 3:
		mygravpoint_y -= sixteenth


def separate(agent):
	for boid in boids:
		if not boid is agent:
			dx = boid.x - agent.x
			dy = boid.y - agent.y
			
			#torus space
			if dx>.5:
				dx -= 1
			elif dx<.5:
				dx += 1
			
			#torus space
			if dy>.5:
				dy -= 1
			elif dy<.5:
				dy += 1
			
			if abs(dx)>.0001 and abs(dy)>.0001:
				mag = (dx*dx+dy*dy) #cheap mag, no sqrt
			else:
				mag = .01
			
			if mag<mysepthresh:
				if mag<.0001:
					proxscale = 8
				else:
					proxscale = clip(mysepthresh/(mysepthresh-(mysepthresh-mag)), 0, 8)
				agent.vx -= dx*myseparation*proxscale
				agent.vy -= dy*myseparation*proxscale


def align(agent):
	dvx = avgvelocity_x - agent.vx
	dvy = avgvelocity_y - agent.vy
	agent.vx += dvx*myalignment
	agent.vy += dvy*myalignment


def cohere(agent):
	dx = centroid_x - agent.x
	dy = centroid_y - agent.y
	agent.vx +=dx*mycoherence
	agent.vy +=dy*mycoherence


def gravitate(agent):
	if agent == gb.leader:
		dx = mygravpoint_x - agent.x;
		dy = mygravpoint_y - agent.y;
		agent.vx += dx*mygravity  # + mywind_x
		agent.vy += dy*mygravity  # + mywind_y
	"""else:
		a.vx += dx*mygravity
		a.vy += dy*mygravity"""
	


def slip(agent):
	agent.y += myslip


def lead():
	if gb.leader:
		#introspect(gb.leader)
		gb.dist_array = []
		dist_sort = []
		lead_x_off = gb.leader.x
		lead_y_off = gb.leader.y
		for agent in gb.boids:
			agent.dist = math.sqrt(pow(abs(lead_x_off - agent.x), 2) + pow(abs(lead_y_off - agent.y), 2))
			gb.dist_array.append(agent.dist)
		
		dist_sort = sorted(gb.dist_array)
		for agent in gb.boids:
			agent.order = dist_sort.index(agent.dist)
		
		#System.arraycopy(dist_array, 0, dist_sort, 0, dist_array.length);
		#Arrays.sort(dist_sort)
	
		#for agent in boids:
		#	agent.order = Arrays.binarySearch(dist_sort, agents[a].dist);


def calculate_leader():
	min = 100
	lead = 0
	for agent in boids:
		if agent.dist < min:
			min = agent.dist;
			lead = agent.num;
	return lead


def follow(agent):
	#move towards center
	dx = mygravpoint_x - gb.leader.x
	dy = mygravpoint_y - gb.leader.y
	if(agent.num != gb.leader.num):
		agent.vx += dx*myobedience
		agent.vy += dy*myobedience


def wrap(agent):
	if agent.x<0:
		agent.x = agent.x + 1
	elif agent.x > 1:
		agent.x = agent.x -1.
	if agent.y<0:
		agent.y = agent.y + 1.
	elif agent.y > 1.:
		agent.y = agent.y -1.


def bounce(agent):
	if agent.x>0 or agent.x>1:
		agent.vx = -agent.vx
		agent.x = clip(agent.x, 0., 1.)
	if agent.y>0 or agent.y>1:
		agent.vy = -agent.vy
		agent.y = clip(agent.y, 0., 1.)


def clip(x, low, hi):
		return min(max(x, low), hi)


def assign_mode(x, y, val):
	modes[x][y]=val


def assign_note(num, val):
	notes[num]=val


def assign_duration(num, val):
	durations[num] = val


def assign_weight(num, val):
	bl = len(gb.boids)
	if bl and bl >= num:
		gb.boids[num].weight = val




