# Mod-01 Lec-02 Newtonian mechanics

Channel: nptelhrd
URL: https://www.youtube.com/watch?v=8X1x9RLaaxc&list=PL5E4E56893588CBA8&index=2&t=1s

## Transcript

**[1:04]** So, let us start now, the formal study of
a first topic that we would like to look at
**[1:12]** in this course, which is classical dynamics,
by which I mean Newtonian mechanics. And then,
**[1:31]** after we finish the study of classical dynamics,
in some sense in the conventional way, we
**[1:37]** will go on to see how it merges with other
areas of physics. The first topic we would
**[1:43]** like to take up is the idea that the mechanics
of a particle, which you study in, say, physics
**[1:50]** one can be generalized to systems of particles,
many, many particles taken together, and the
**[1:56]** first concept that we would like to get clear
is that of degrees of freedom. So let me illustrate
**[2:02]** that. What I mean by the degrees of freedom
of a physical system, such as a collection
**[2:14]** of particles or an object or rigid bodies
obeying Newtonian mechanics in some sense.
**[2:22]** So I start with a single particle, which can
move in three-dimensional space. I need three
**[2:27]** coordinates - three independent coordinates
- to specify its position at any given instant
**[2:31]** of time and it has 3 degrees of freedom to
start with it. What happens if I have two
**[2:37]** particles moving in space? What is the number
of degrees of freedom? I need 6 degrees of
**[2:43]** freedom, and if I have N particles, I need
3N degrees of freedom, provided these particles
**[2:51]** move in space and there are no constraints
among them at all; they are, of course, subject
**[2:57]** to interaction; they interact with each other,
they move under each other's influence and
**[3:01]** so on, but they move in three-dimensional
space; each of them requires three coordinates.
**[3:05]** It does not matter whether these coordinates
are Cartesian coordinates or spherical polar
**[3:09]** coordinates or cylindrical polar coordinates,
does not matter; what matters is the number
**[3:14]** of coordinates. The number of coordinates
for N particles; so N particle system, has
**[3:26]** 3N coordinates.
I am going to call these generalized coordinates.
**[3:34]** The reason is they do not have to be Cartesian
coordinates; they do not necessarily have
**[3:39]** to be angular coordinates. There could be
some of them Cartesian, some of them angular,
**[3:43]** some of them in other coordinate system and
so on; it does not matter. What matters is
**[3:47]** the number here and we are going to use a
certain symbol for these coordinates. I am
**[3:50]** going to use little q for these coordinates.
But before I do that, I would like to introduce
**[3:55]** the idea of constraints.
If I tell you, that a particle is constrained
**[4:00]** to move on a plane such as this, then of course,
it has only 2 degrees of freedom, and if you
**[4:06]** consign it, if you confine this particle to
a line, then it has a single degree of freedom.
**[4:12]** What is important to recognize is that you
must count the number of degrees a freedom
**[4:17]** before you start solving the equations of
motion.
**[4:20]** So first, you have to specify what the independent
degrees of freedom are. Now we have seen that
**[4:25]** for N particles you have 3N coordinates, 3N
degrees of freedom. But suppose I start putting
**[4:30]** constraints, suppose I tell you that particle
one and particle two are connected up in such
**[4:39]** a way that the distance between them is fixed
it cannot be changed. Then how many independent
**[4:45]** degrees of freedom are there? There are 5
independent of degrees of freedom, because
**[4:51]** you have 6 coordinates between these two particles,
but then you also have a constraint that r
**[4:58]** 1 2 equal to a constant. The distance between
1 and 2 is constant, is fixed; it is given
**[5:04]** to you as part of the problem. In which case,
you subtract one independent coordinate out
**[5:09]** and you have 5 independent coordinates left.
Therefore, the lesson is to find the number
**[5:16]** of independent degrees of freedom, you first
must take the total number of degrees of freedom
**[5:21]** and subtract out all those degrees, which
you can eliminate due to the constraints on
**[5:26]** the problem.
Suppose I have three particles, the third
**[5:31]** one here, and I tell you that the distance
between 2 and 3 is also constant. How many
**[5:41]** degrees of freedom do we have now? Independent;
we have 7 independent degrees of freedom,
**[5:47]** and if I join all three and I tell you that
all these three distances are constant - fixed
**[5:53]** - then of course, these three particles could
be imagined to be at the vertices of a rigid
**[5:57]** triangle and you have 6 independent degrees
of freedom left. So, now what is the general
**[6:05]** story? I have N particles, 3N coordinates,
and now I tell you that all the distances
**[6:10]** between particles are constant.
**[6:14]** r i j equal to constant for 1 less than equal
to i j less than equal to N. How many independent
**[6:25]** degrees of freedom do we have now? How many
constraints are there? Well, I have N particles
**[6:33]** and there are 3N coordinates and how many
constraints are there? I tell you that all
**[6:37]** the distances, all the pair-wise distances,
are constant. Nc 2 is the number of constraints
**[6:46]** number of pairs equal to N times N minus 1
over 2, and therefore, how many independent
**[6:56]** degrees of freedom are there? Well let us
try that out.
**[7:01]** So number of independent degrees of freedom
equal to... I put a question mark here. I
**[7:12]** am not altogether convinced 3N minus N minus
1, N times N minus 1. What happens if we put
**[7:20]** N equal to 4? What happens if we put N equal
to 4 here? What happens if we put N equal
**[7:34]** to 5. What happens if we put N equal to 8?
Becomes negative, but that is not physical;
**[7:47]** it is obvious that you cannot have a negative
number of degrees of freedom; this cannot
**[7:50]** go on increasing; it is very clear from here;
because this increases linearly in N, and
**[7:55]** that increases like the square of N; so pretty
soon that is going to overtake it. So what
**[8:01]** would you say is wrong? What should we do?
Speak in a mike; yes.
**[8:10]** If we have a case structure with a triangle,
some constraints become redundant.
**[8:17]** Some of the constraints become redundant.
It is quite clear that you do not need all
**[8:21]** these constraints; just some of them are enough
to hold the object rigidly; how many would
**[8:27]** those be?
Well in the case of a triangle, you have...
**[8:35]** No, it is not 2, because if you have these
two guys, you can still move this around,
**[8:40]** you can still do this, distances are still
fixed, but if it is a third one, then its
**[8:46]** rigid. So how many independent degrees of
freedom do we really have? Now this is mimicking
**[8:52]** a rigid body; a rigid body is one in classical
mechanics - in Newtonian mechanics - you define
**[8:57]** a rigid body as one where the distance between
any pair of points is fixed once and for all.
**[9:03]** So, it is quite clear, that this cannot be
a formula. This cannot be the number of independent
**[9:08]** degrees of freedom, simply because this increases
like the quadratic function of N, whereas
**[9:13]** this is linear; where does this stop? 6. 6
degrees of freedom; a rigid body has 6 independent
**[9:24]** degrees of freedom. So no matter how large
N is, it is quite clear that you have just
**[9:29]** 6 independent degrees of freedom; the remaining
constraints are redundant completely. And
**[9:34]** what are the 6 degrees of freedom? Now, we
can start counting them, and when you compute
**[9:38]** degrees of freedom, the way to check if something
is right or wrong is to do it in two different
**[9:42]** ways. Compute the number of degrees of freedom
in two different ways, and if the answers
**[9:47]** match, then you know you are on the right
track.
**[9:49]** How many degrees? We have said that a rigid
body has 6 degrees of freedom. I should like
**[9:53]** to count these degrees of freedom and tell
you what they correspond to. You can choose
**[9:58]** coordinates in different ways, but I would
physically like to understand what these coordinates
**[10:03]** correspond to.
**[10:04]** So here is a rigid body. Let us take something
like a cube and this has 6 degrees of freedom
**[10:15]** - independent degrees of freedom - we should
like to count them; here is one way of counting
**[10:20]** them. I need 3 degrees of freedom to tell
you where the center of mass of this object
**[10:25]** is in space. So with respect to some fixed
coordinate system, the center of mass of this
**[10:37]** object is at some point - position vector
R, and it has of course, three coordinates
**[10:44]** associated with it and that takes care of
3 degrees of freedom. There are 3 more degrees
**[10:50]** of freedom, which tell you what the orientation
of this object is in space and how do you
**[10:57]** tell what that is.
Well there are several ways of doing this,
**[11:02]** but a simple way of doing it is the following:
associate - here is my fixed coordinate axis
**[11:08]** in space - with the body associate a coordinate
system; a body fixed coordinate system. So
**[11:17]** associate with it a coordinate system, which
looks like this - body fixed coordinate system
**[11:22]** - and then the orientation of body in space
relative to this fixed coordinate system is
**[11:29]** dependent on how this coordinate system is
twisted or turned with respect to this coordinate
**[11:34]** system. Now, what this means is, you cannot
translate this R, put it here and compare
**[11:41]** and see how the new coordinate system, how
the body fixed coordinate system, is oriented
**[11:45]** with respect to the space fixed coordinate
system. And what this means is you start with
**[11:50]** a space fixed coordinate system and you want
to go to a body fixed coordinate system, to
**[11:55]** go to this set of coordinates from this, you
have to do 3 Euler rotations, you rotate about
**[12:01]** three different axis and you need three angles
for this purpose.
**[12:06]** Therefore, you have three coordinates for
the center of mass, and three angles, which
**[12:12]** will specify the manner in which this coordinate
system is turned to reach this coordinate
**[12:20]** system from here. What sort of rotations do
you need to reach this coordinate system from
**[12:24]** here? That is 3 more degrees of freedom, and
therefore, you have 6 degrees of freedom.
**[12:30]** Another way of looking at it is to say here
is a rigid body, and now I start here, and
**[12:36]** here is the center of mass of this rigid body.
So three coordinates are gone there, and then
**[12:42]** to reach the orientation of this coordinate
system from this coordinate system, I take
**[12:48]** this coordinate system and turn it about some
axis through a certain angle. So to specify
**[12:57]** the axis of rotation, I need two angles, because
the axis of rotation in three-dimensional
**[13:03]** space is a unit vector, and unit vector requires
two numbers to specify, because the sum of
**[13:09]** the squares of the three numbers is unity.
So I need to specify a latitude and a longitude
**[13:15]** if you like, on the surface of a unit sphere
to reach to specify an axis, and about that
**[13:21]** axis I can rotate through any angle from 0
to 2 pi. Now that is one more degree of freedom.
**[13:28]** So we have computed this in two different
ways, and each time, we discover that for
**[13:32]** a rigid body, you have 6 degrees of freedom;
**[13:33]** now that is a general rule; for a rigid body,
number of independent degrees of freedom equal
**[13:51]** to 6 for any N, is this clear that you have
just 6 degrees of freedom.
**[14:00]** And of course, you are used to this from spectroscopy,
when you study the spectra of diatomic molecules.
**[14:05]** For example, you are told there are 3 translation
degrees of freedom, the 2 rotational degrees
**[14:09]** of freedom, and the reason, of course, is
that in the diatomic molecule, you have two
**[14:13]** molecules connected by a invisible bar, and
there is no moment of inertia for rotations
**[14:19]** along that axis; and therefore, you have 2
degrees of rotational freedom and then 3 degrees
**[14:25]** of translational freedom.
In the moment, you have a tri-atomic molecule
**[14:28]** you have 6 and so on, provided the molecule
is not deformable. If, of course, it is deformable
**[14:35]** the distances between the atoms changes, then
you have 9 degrees of freedom and depending
**[14:41]** on the energy you can excite any number of
these modes. But for a rigid body, as far
**[14:46]** as we are concerned, we have 6 degrees of
freedom, 3 of which I will call translational,
**[14:51]** because they tell you where you should move
to take it center of mass from a fixed set
**[14:56]** of coordinates, and then 3 orientational degrees
of freedom - tell you how the system is oriented.
**[15:02]** So, henceforth, what we are going to do is
to pretend that we always have eliminated
**[15:10]** the constraints and computed the number of
independent degrees of freedom.
**[15:17]** Now, you have to be a little careful here,
because the constraint does not always eliminate
**[15:23]** a degree of freedom. For instance, if I told
you that you have a particle moving along
**[15:28]** on this table, and the table has boundaries,
and you cannot get out of those boundaries,
**[15:33]** then what you doing, is to confine the particle
to a certain region. It has 2 degrees of freedom
**[15:38]** because it is on a plane, but it has got inequalities,
it says its x coordinate not exceed this value
**[15:43]** and the y coordinate cannot exceed that value.
Those are inequalities, but they do not reduce
**[15:49]** the number of degrees of freedom. If I told
you that on the xy plane, a particle moves
**[15:54]** on the xy plane in the first quadrant only,
it still has 2 degrees of freedom nothing
**[16:01]** is eliminated.
**[16:02]** So, whenever you can eliminate degrees of
freedom, these are called holonomic constraints
**[16:11]** or integrable. Never mind why I call it integrable
for the moment, and then you have non holonomic.
**[16:33]** This cannot be used a non holonomic constraint
cannot be used in general to eliminate a degree
**[16:48]** of freedom. In general, non holonomic constraints
would be inequalities of the kind I just illustrated
**[16:59]** or they could involve velocities as opposed
to positions alone or coordinates alone, in
**[17:05]** which case it is not all clear that you can
integrate matters out to eliminate a degrees
**[17:10]** of freedom, we will come across some examples
of this as we go on, but by and large, in
**[17:14]** this course, we will restrict ourselves to
holonomic constraints.
**[17:17]** Now, I made the point that you must first
identify the number of independent degrees
**[17:25]** of freedom, and then start writing down the
equations of motion, and solving them; not
**[17:31]** the other way about. A very simple example
is the following - I imagine this piece of
**[17:36]** chalk to be a point particle moving in space
under the action of the earth's gravity,
**[17:42]** I hold this particle here - at this point.
So I know its initial position, and I know
**[17:48]** the force on it due to gravity. Can you predict
its future from that? Can you predict its
**[17:55]** future motion from that?
Well, I take this chalk, and I drop it from
**[18:01]** rest, and of course, if it drops straight
down, on the other hand, I give it a little
**[18:06]** horizontal velocity, and then it moves in
a parabolic path. Strictly speaking, an elliptic
**[18:12]** path - part of an elliptic part - I give it
a slightly higher velocity; it goes into orbit
**[18:16]** round the earth; I give it even higher horizontal
velocity and it escapes in a hyperbolic orbit.
**[18:23]** So, how could you say, that if I tell you
the initial position and the initial force,
**[18:29]** the future is predictable? It is not; it looks
like it 
is not. Is there sufficient data? Does it
**[18:39]** suffice to tell you what the initial positions
are and the initial forces are? You need initial
**[18:45]** velocities also. Newton's equations are
second order in time. When you need to grade
**[18:50]** it you have two constants of the motion in
the one-dimensional case, and then of course,
**[18:54]** you need to know both the initial position
as well as the initial velocity to predict
**[18:59]** what is going to happen next.
So, it is immediately clear that dynamics
**[19:05]** occurs in a space, which is not just the coordinates,
but also the velocities. This space is called
**[19:13]** phase space. We are going to do a lot about
phase space, but it is good to get this idea
**[19:18]** right in the beginning, straight right in
the beginning, that the equations of motion
**[19:24]** require you to specify both the initial coordinates
as well as the initial velocities or the slopes
**[19:32]** of the trajectories, not just the point on
the trajectory, for you to be able to solve
**[19:37]** this equations uniquely, and this was a simple
example of it.
**[19:43]** That immediately tells you that dynamics is
not happening in real space; it is happening
**[19:47]** in something called phase space, which we
will study in greater detail, but it is a
**[19:53]** lesson. And secondly, let me ask you - how
many degrees of freedom does this particle
**[19:56]** have? It has 3. You must not make the mistake
of saying, if I drop this from rest, it moves
**[20:03]** in a straight line; therefore, it has 1 degree
of freedom; you should not say that; that
**[20:11]** is not true, because you cannot count degrees
of freedom after you solve the equations of
**[20:17]** motion. You have to count the degrees of freedom
- independent degrees of freedom -before you
**[20:22]** solve the equations of motion. You must then
identify the corresponding velocities as well,
**[20:28]** and then, the equations of motion are written
down in terms of these coordinates and velocities,
**[20:33]** and solve with some specific initial conditions.
The idea is once you specify the initial conditions
**[20:38]** the motion in principle is solved.
So, this is the idea behind dynamics. We are
**[20:44]** going to do this in great generality. You
going to do it in much greater generality
**[20:49]** than even mechanics itself, as we go along,
but you have to get this idea right in the
**[20:53]** beginning, that the number of independent
degrees of freedom has to be determined first,
**[20:59]** and the corresponding generalized velocities
have also to be added on to the set of dynamical
**[21:05]** variables.
**[21:06]** So, let me write that down here - generalized
coordinates... q n and generalized velocities.
**[21:49]** I am going to use overhead dot for the time
derivative of any dynamical variable, and
**[22:02]** these are the so-called generalized velocities,
and this is a notation I am going to use for
**[22:07]** a system, and I do not care what kind of system
it is, which has N independent degrees of
**[22:13]** freedom, and I label them q 1 to q n. Some
of them could be Cartesian coordinates, some
**[22:21]** of t hem could be angular coordinates, they
could be mixtures of the two, we do not care,
**[22:28]** but this is the general framework.
And then, to solve the equations of motion,
**[22:35]** you need to know a certain amount of initial
data. You need to know the values of these
**[22:40]** generalized coordinates and the generalized
velocities at an initial instant of time,
**[22:46]** at some initial instant of time. And then,
the task is to write the equations of motion
**[22:49]** down, and to solve these equations. And you
guaranteed then suitable conditions, the solution
**[22:56]** is unique. It is in this sense the Newtonian
dynamics is deterministic. You give me the
**[23:02]** initial data and the equations of motion,
and the future is uniquely determined. We
**[23:11]** going to write these equations once again,
look at them. The simplest instance, of course,
**[23:15]** you have Newton's equations. Let us do this
for the very, very simple case of a single
**[23:20]** particle moving along the x-axis, just in
one-dimension; there is just 1 degree of freedom.
**[23:27]** A particle of mass m, moving along the x-axis
has a single degree of freedom.
**[23:31]** So one-d motion of a particle and let me call
this just q; the x-coordinate of this particle
**[23:46]** just q; just to use to get this notation.
What is the equation of motion of this particle?
**[23:52]** If it is subject to some force f of q, what
is the equation of motion? What is Newton's
**[24:01]** equation? It is equal to mass times m q double
dot equal to the force on this particle, and
**[24:08]** this force could, in fact, be quite a general
force; it could depend on where the particle
**[24:14]** is; certainly, it could do that. So it is
general a function of q. Could it depend on
**[24:21]** q dot as well? Can you give me the example
of a force, which actually depends on the
**[24:27]** velocity of the particle?
Viscous force. Anything else? Magnetic force.
**[24:33]** Force due to a magnetic field; it is velocity
dependent. So certainly, in general, this
**[24:37]** would have also a q dot. Could it depend on
time explicitly? Could it depend on time explicitly?
**[24:50]** Yes or no? Yes. What is to stop me from pushing
this particle up and down by some prescribed
**[24:57]** external force, which changes with time? So,
in general, it could depend on time, could
**[25:08]** depend on time as well. Certainly could. Yes?
Pardon me.
**[25:14]** If the force depends on q and t, it depend
on q dot?
**[25:24]** He says if the force depends on q and t it
accounts for q dot; is that true? It is a
**[25:32]** good question. Is that true? You have to appreciate
the fact that q and q dot are independent
**[25:39]** dynamical variables, because I could specify
them independently, initially. After you have
**[25:47]** solved an equation of motion under certain
conditions, then of course, it turns out that
**[25:53]** q is a function of t, and q dot is just found
by differentiating it, whether it is after
**[25:58]** you solve the equation of motion, for a specific
motion, not true in general.
**[26:04]** So, again you have to get used to this idea,
that coordinates and velocities are actually
**[26:12]** independent dynamical variables, because the
equation of motion depends on the acceleration;
**[26:20]** that is Newton's equation of motion; that
is a way it is. We will see why as we go along.
**[26:25]** But accepting Newton's equations for the
moment, this is an equation for the rate of
**[26:30]** change of the velocity and it is a second
order equation in the coordinates; it is a
**[26:36]** second order differential equation. So positions
and velocities are independent dynamical variables,
**[26:42]** because initially you could specify them independently
of each other.
**[26:48]** So you must not make the mistake of saying
q dot is determined by giving q; it is determined
**[26:52]** only if you give me q already as a function
of t, which happens only after you solve the
**[26:57]** equation of motion.
That is a very good question - why cannot
**[27:04]** f depend on higher forces? q double dot, for
example, q triple dot and so on. Well our
**[27:10]** experience has been, first of all Newton's
equations do not say anything about what kind
**[27:16]** of force you have here at all. You could have
in principle very complicated forces, could
**[27:21]** depend on the history of the particle as well.
Now, we are making an assumption that it does
**[27:26]** not do so, that it depends only on q, q dot,
and t and that is an assumption; based on
**[27:32]** experience to start with. There are situations
where the force depends on q double dot.
**[27:37]** For example, I give you a simple example we
will not consider much of this at the moment.
**[27:43]** If you have a charged particle that is subject
to external electric and magnetic fields,
**[27:48]** and it moves in space, if it accelerates,
then principle it radiates, and once it radiates
**[27:55]** - electromagnetic radiation - that radiation
could act back on the particle and produce
**[28:00]** what is called radiation reaction, leading
to radiation damping, and that force indeed
**[28:06]** turns out in classical physics to depend on
the acceleration of the particle. So, you
**[28:11]** could have situations where you have q double
dot here as well; this is possible, but these
**[28:17]** are the simplest instances most of the time.
Now, already this is not an easy problem as
**[28:24]** it stands, because the forces in general are
coordinate dependent, velocity dependent,
**[28:27]** and it is time dependent, and when it is time
dependent, this implies that they are naturally
**[28:33]** changing the rules of the game as time goes
on. I am applying a force, which is explicitly
**[28:38]** time dependent, and such a dynamical system
is said to be non-autonomous. If it did not
**[28:53]** have this time dependence, I would say it
is autonomous. Of course, non autonomous systems
**[29:01]** are bound all round us. If, for instance,
I took a simple, single particle, and you
**[29:07]** applied a time dependent force explicitly,
it was charged, you applied an electric field,
**[29:12]** and you change the electric field as a function
of time, then it will be a non-autonomous
**[29:16]** system. We will come to non- autonomous systems,
just tell you the possibility this exists.
**[29:22]** But in the simplest instances, when you do
not have explicit time dependents, and you
**[29:26]** do not have magnetic fields, you do not have
viscous forces and so on, you have just f
**[29:31]** of q; nothing more than that; this would be
the simplest instance. Now let us look at
**[29:38]** a simple harmonic oscillator and ask - what
does it do? Just a single simple harmonic
**[29:43]** oscillator.
**[29:46]** So you have the x-axis; this is 0 and you
have a particle oscillating back and forth.
**[29:51]** What is the equation of motion, if the frequency
with which it is oscillated - the natural
**[29:55]** frequency is omega - what is the equation
of motion? It is mq double dot equal to...
**[30:11]** Is this is correct? q double dot is minus
omega squared q. So move this m, this is minus
**[30:21]** kq, where k was a spring constant and you
could write this as minus omega square; just
**[30:33]** to recall. What is special about this force?
It is directed towards center of force, center
**[30:44]** of attraction, but what is special about it?
It is a conservative force; this force is
**[30:52]** conservative in the sense that it is derivable
from a potential.
**[30:57]** So as soon as you have a force that is conservative,
we know that the q double dot equal to mq
**[31:09]** double dot is F of q, and if this is a conservative
force, this implies this force is minus dV;
**[31:26]** it is the derivative of a potential. Now what
is the potential here? What is V of q? It
**[31:48]** is one half m omega squared q squared. In
a general sense, if I took an arbitrary potential
**[32:06]** V of q, and I said I have this particle moving
on the x-axis under the influence of a conservative
**[32:13]** force derived from a potential V of q, then
this is the equation of motion: N q double
**[32:18]** dot minus dV q over dq. But now you would
say, look this is a second order equation,
**[32:25]** and to solve this set of equations, this single
equation, you need two initial conditions,
**[32:30]** what should those be? Positional velocity.
For instance, I could choose q of 0 and q
**[32:36]** dot of 0, I could specify them independently
and I can solve this in principle.
**[32:41]** Therefore, it suggests that what we should
really do is the following - we should write
**[32:48]** q dot equal to V; you should write V dot equal
to... this side minus v prime q over m; I
**[33:05]** use the prime for a derivative with respect
to the argument. This is the way I should
**[33:12]** write these two equations. That is a set of
two first order equations and this explicitly
**[33:19]** tells you that the independent dynamical variables
are q and V or q and q dot. And, then of course,
**[33:30]** this plus initial conditions q of 0, v of
0, together implies a unique solution, together.
**[33:58]** It turns out this is the most fruitful approach
in mechanics, we write the whole thing down
**[34:03]** in terms of first order differential equations,
always. And what is the advantage of writing
**[34:09]** this set of first order equations? They are
coupled to each other, because the q equation
**[34:12]** involves V, the V equation involves q once
again, but they are first order differential
**[34:17]** equations, and therefore, specifying the complete
set of initial conditions, in principle, leads
**[34:23]** to a unique solution.
Now let us pursue this in our case of our
**[34:29]** harmonic oscillator. We know the solutions;
we can write the solution down completely;
**[34:35]** it is quite trivial to solve this you get
cosines and sine, in general, as functions
**[34:40]** of t, and then, you fit in the initial conditions
and you got the solution uniquely. But this
**[34:45]** is not as interesting as finding out what
the general kind of solution looks like, in
**[34:50]** this problem, it is periodic, you know that;
what is the most general kind of solution,
**[34:54]** one can write down? You do not even need to
solve this problem, the reason is - I could
**[34:59]** take the attitude, and I plot q versus V.
**[35:08]** That is q dot on the vertical axis, and then,
since, the initial conditions imply specifying
**[35:16]** a point on this plane - some initial q of
0 and v of 0 - as time goes along q changes
**[35:23]** to q of t and v changes to v of t, this point
moves on the plane and this plane is called
**[35:30]** the phase plane. A point on this plane specifies
this system completely, and this point changes
**[35:49]** as a function of time, and it traces a trajectory
called the phase trajectory. So what to do
**[35:58]** is to start at this point - this is the initial
point - and as a function of time to move
**[36:03]** in this way.
Now, tell me, can this trajectory cut itself?
**[36:10]** This is the phase trajectory. This point here
q of 0, v of 0 and at any arbitrary instant
**[36:29]** of time this is q of t. I am interested in
looking into the future. So I start with a
**[36:41]** initial condition, and I say what happens
as a function of time, as things go along.
**[36:45]** But surely the initial condition itself - had
the motion been going along forever - would
**[36:49]** have been reached from some earlier time,
and therefore, it is really part of a half
**[36:54]** trajectory. If I had started the whole thing
at t is equal to minus infinity, there would
**[36:58]** have been a trajectory, which comes along
q, at 0 it would take this point and then
**[37:02]** it keeps going further down.
Now, can this trajectory do the following?
**[37:08]** Can it do that? Could this trajectory do that?
Why not?
**[37:20]** If the point of intersection is an initial
condition the future is supposed to be determined
**[37:26]** uniquely.
If the point of, very good, if the point of
**[37:29]** intersection is an initial condition the future
is supposed to be determined uniquely from
**[37:33]** this initial condition, and the force equations,
and the equation of motion. So, you start
**[37:39]** with this point, and you have two outward
arrows, and therefore, the future is not unique,
**[37:44]** because you could have started with that point
of intersection as the initial state.
**[37:50]** And then, you are told the future is uniquely
determined, cannot branch of two different
**[37:53]** trajectories, and therefore, the phase trajectories
of such a system cannot intersect themselves.
**[38:04]** And this is true in any number of dimensions;
it is true in general for dynamical systems,
**[38:10]** provided you do not change the rules in between.
In other words, provided you do not have a
**[38:16]** non-autonomous system. If you have a non-autonomous
system, then this is possible, because then
**[38:25]** it distinguishes in time, it is not time translation
invariant; the equations of motion are changing
**[38:31]** as a function of time. The rules are changing;
therefore, there is nothing to stop you from
**[38:35]** intersecting the phase trajectories from intersecting
themselves.
**[38:39]** For autonomous systems, phase trajectories
cannot intersect themselves; they cannot intersect
**[38:47]** each other either. Two different phase trajectories
corresponding to two different initial conditions
**[38:52]** cannot intersect. We will write that down;
it is so important that we should write this
**[39:20]** down; not intersect each other.
**[39:46]** Is this possible? It is possible that this
system does the following?
**[39:55]** It starts at some point it goes along and
comes back to its initial point; is this possible?
**[40:02]** This is eminently possible, because once it
reaches this point it has no choice, but to
**[40:08]** retrace what it did earlier and comes right
back. And what do you call such motion where
**[40:13]** the system comes back to itself after some
time? Periodic motion; it is periodic motion.
**[40:20]** The only exception is periodic motion. So,
we say closed - simple closed - 
implies and this is implied by periodic motion.
**[40:39]** Let us look at the case of the harmonic oscillator
once again, and ask what happens. We know
**[40:48]** in this case every initial condition corresponds
to periodic motion of some kind. So let us
**[40:53]** look at that case.
**[40:54]** Now, I specialize to the harmonic oscillators.
So q dot is v and v dot is minus omega squared
**[41:01]** q; so the q double dot is equal to minus omega
squared q. What will the phase trajectories
**[41:10]** look like? You are going to integrate this;
you have to take this equation of motion and
**[41:18]** integrate it. So let us do that. Let us integrate
this equation. We have to take these two equations,
**[41:24]** find out what the slope of the phase trajectory
is like, and then integrate it.
**[41:28]** So I divide one equation by the other, and
I get dv over dq equal to minus omega squared
**[41:34]** q over v. I need to integrate; this is the
slope of the phase trajectory at any point.
**[41:49]** What should I do to integrate this? Well the
variables are separable, as you can see it
**[41:54]** is very simple; so it says vdv plus omega
square qdq equal to 0. And if I integrate
**[42:02]** this, what happens? What is the integral of
this? Half v squared; so it says half v squared
**[42:13]** plus half omega squared q squared equal to
constant; a constant of integration. What
**[42:22]** is the significance of this constant of integration?
Energy...
**[42:27]** Almost; if I multiply this by m, then of course,
you immediately see that this is nothing but
**[42:36]** writing down the fact that the total energy
of the system, and this remember is v of q,
**[42:45]** potential energy; this is equal to e; I choose
a symbol e for this constant of the motion;
**[42:55]** very evocative, because I know it is the energy
in the system.
**[43:03]** Now what is this equation? What does it look
like? What kind of equation is this? In general
**[43:10]** it is an ellipse; unless, of course, these
numbers are such that the coefficients of
**[43:15]** these two are equal; in general it is an ellipse.
Now, what kind of ellipse? Where are the principal
**[43:20]** axis of the ellipse? The coordinate axis themselves;
this is of the form ax squared over a squared
**[43:27]** plus y squared over b squared is 1; so it
is some kind of ellipse in this fashion.
**[43:37]** Wherever you start on this ellipse, whatever
be the initial conditions, you are going to
**[43:42]** remain on this ellipse and come back forever.
But you should never draw a phase trajectory
**[43:46]** without drawing an arrow on it to show the
orientation; namely, how does the system move
**[43:51]** on the phase trajectory as time increases.
So what should I do? There are just two possibilities
**[43:56]** - either it goes clockwise or counter clockwise.
What does it do here? This physical problem
**[44:04]** corresponds to a harmonic oscillator, which
is oscillating with center of oscillation
**[44:08]** at the origin of coordinates; therefore, you
can determine what the direction of motion
**[44:13]** is in this phase trajectory; in which direction
does it move? this way; clockwise counter;
**[44:18]** how do you say that?
q dot is one axis; q dot is positive.
**[44:25]** Well, if I start, if this is the center of
oscillation, I am going back and forth on
**[44:31]** this axis, this is 0, if I stretch this oscillator
to the end of its amplitude and let go from
**[44:39]** rest, this corresponds to being here at this
point. q is at its maximum. the velocity is
**[44:48]** 0. And then as you can see, when I let go
from rest, the velocity directs it back towards
**[44:54]** the center of motion, and therefore, it is
directed to the left; in other words, the
**[44:58]** velocity goes negative. So inside it does
this; goes negative, and then, hits at this
**[45:05]** point, it passes through the origin again
going rapidly leftwards, goes to the left
**[45:11]** most extreme - the amplitude here, and starts
moving to the right again so the velocity
**[45:15]** becomes positive until it comes back here.
Therefore, this is the phase trajectory for
**[45:22]** a simple harmonic oscillator.
We know, of course, that the amplitude of
**[45:30]** the oscillator determines the energy and vice
versa. So it is quite clear that this point
**[45:36]** - the maximum value of q - is given by what?
In terms of e, what is it equal to? It is
**[45:49]** square root of 2 e over m omega squared. That
is another way of remembering the fact that
**[46:00]** the energy of an oscillator is one half ka
squared, where k is a spring constant, and
**[46:06]** a is the amplitude; it is exactly the same
statement.
**[46:10]** What does this point correspond to? What is
the semi minor axis? 2 e over m. What happens
**[46:29]** if I start with an oscillator, which has a
slightly higher energy? What would the ellipse
**[46:36]** look like? It would be a concentric ellipse;
exactly the same way; so that would be another
**[46:44]** ellipse, which will go like this. And therefore,
as you can see, every time you specify a positive
**[46:54]** number e, the entire phase trajectory is determined.
The system is constraint to then, confined
**[47:02]** to this ellipse depending on what the value
of e is, the plane is therefore laminated
**[47:09]** by these ellipses.
There is just one exceptional point; there
**[47:13]** is just one initial condition, which does
not fall into this picture. And what is that?
**[47:20]** If it starts at the origin; in other words,
you do not stretch it; it is at the origin
**[47:24]** and it has zero velocity, then it remains
there forever. The origin in the phase plane
**[47:32]** is a trajectory all by itself; user does not
move, just stays, the ellipse there; it is
**[47:39]** the equilibrium point. We will come back to
the significance of this equilibrium point,
**[47:46]** because it is a special trajectory all by
itself. It corresponds to putting e equal
**[47:51]** to 0, and then of course, both v and q are
compelled to be 0.
**[48:01]** What is special about the harmonic oscillator?
What is really special about harmonic oscillations,
**[48:06]** which are there all around us? The time period,
is well... the time period is constant, in
**[48:12]** what sense? Independent of the amplitude;
harmonic motion is the only motion where the
**[48:19]** time period is independent of the amplitude.
There are other potentials for which also
**[48:25]** you have time period which is independent
of the amplitude, we will come to that. They
**[48:28]** are related to the harmonic oscillator, but
there is a simple way of showing that harmonic
**[48:33]** motion is the only one that is independent
of the amplitude or the energy equivalent.
**[48:38]** For the moment, I want to point out that our
statements here are borne out, independent
**[48:44]** phase trajectories, different phase trajectories,
do not intersect themselves, and each phase
**[48:50]** trajectory that is a closed orbit corresponds
to periodic motion; that is it.
**[48:55]** We would like to show that the time period
is independent of the amplitude; we would
**[48:59]** like to see if we can do that without doing
any hard work. Is there a simple way of doing
**[49:05]** this? Of course, you can solve the harmonic
oscillator problem, it is very trivial moment
**[49:09]** the moment you solve it, but is there is a
simple way of doing this? There is simple
**[49:12]** way of understanding that there is no time
dependence, no amplitude dependence on the
**[49:17]** time period. By the way, could you write down
a formula for the time period from this phase
**[49:23]** trajectory?
Notice, that I have not solved the equation
**[49:29]** of motion. I have not started writing cosines
sines or anything like that; I have just looked
**[49:35]** at the phase trajectory and that is sufficient
actually, because what it is telling me is
**[49:40]** that an oscillator, which starts here or here
or here or here, anywhere on this trajectory,
**[49:45]** they are just minor changes in initial conditions,
the motion is exactly the same. So one of
**[49:51]** the primary advantages of looking at phase
trajectory is that you do not have to worry
**[49:55]** about specific initial conditions; we are
not so worried about that.
**[50:00]** And in the case of one degree of freedom,
we were able to write down the phase trajectory
**[50:06]** immediately. We did not solve the equations
of motion. You are able to integrate this
**[50:12]** directly. If you have a conservative system
- mechanical system - we know the total energy
**[50:18]** is constant. If therefore, you write the total
energy equal to constant and I write this
**[50:23]** equation.
**[50:24]** I write one half mv square plus v of q equal
to constant e, this specifies the phase trajectory
**[50:36]** already. Because to specify a curve on a plane,
I need one equation between two variables
**[50:44]** and this provides it; there is nothing more
to be done. What happens if I have 2 degrees
**[50:52]** of freedom? I have a problem with q 1 and
q 2. Then, of course, as you can see the independent
**[51:01]** degrees of freedom q 1 and q 2 and associated
with it there will be a q 1 and a q 2 dot,
**[51:07]** what is a dimensionality of phase space in
this problem? It is four; so I cannot draw
**[51:13]** picture of this kind. But the phase trajectory
after I solve the equations of motion would
**[51:20]** still be a one-dimensional object, in a four
dimensional space, and the same thing goes
**[51:26]** through the phase trajectories cannot intersect
themselves, any closed phase trajectories
**[51:30]** periodic motion, and so on. But is it enough
to find one constant of the motion in that
**[51:37]** problem? Would that suffice to tell you what
the trajectory is? No. Between four variables,
**[51:45]** you have one equation, you do not specify
a curve; you specify a three-dimensional surface.
**[51:54]** How many independent equations do you need
before you can specify a curve? I have some
**[52:03]** functions, suppose I say phi 1 equal to c
1; I discovered a constant of the motion;
**[52:10]** some function of q 1, q 1 dot, q 2, q 2 dot
is constant, may be the total energy discovered,
**[52:15]** let us say, and if get an equation of this
kind, this is going to specify in q 1 q 2
**[52:23]** q 1 dot q 2 dot space a four-dimensional object,
a three-dimensional hyper surface.
**[52:29]** But I need a phase trajectory. I, therefore,
need, yes, I therefore need more constants
**[52:33]** of the motion. I need a phi 2 of this c 2
and I need a phi 3 of this; I need all these
**[52:44]** three and the mutual intersection of these
constant surfaces could give me the line,
**[52:50]** could give me the phase trajectory. So you
begin to see already that is not a trivial
**[52:55]** matter to solve problems with more degrees
of freedom than one or two; already with two
**[53:00]** it becomes complicated. If it is of the order
of Avogadro's number, as in the gas in this
**[53:08]** room, it is a hopeless task. So our trick
would be not to attempt, could not be to solve
**[53:16]** equations of motion in general, except for
simple system.
**[53:19]** But we need to go little bit further with
this see how we can find the constants of
**[53:22]** the motion what we need to do do so. But this
should be clear already that you need more
**[53:29]** constants of the motion; the more you find
the closer you are to solving the problem.
**[53:34]** But with one degree of freedom; if it is a
conservative system the fact that the total
**[53:39]** energy of the constant of the motion is enough;
if you write this energy as the function of
**[53:44]** the coordinate and the velocity, the job is
in principle done, complete. We will write
**[53:57]** down phase trajectories and see what they
look like. What if I change the sign of this
**[54:06]** potential? What if for shear perversity, I
wrote this as minus...What would this motion
**[54:16]** look like minus half? What could this look
like? We have to be a little cautious.
**[54:27]** In the case of the harmonic oscillator, if
I plot q versus v of q this is one half m
**[54:36]** omega squared q squared, this was parabolic,
and then the motion took place as if you had
**[54:44]** a particle moving in this well, in this potential
well, back and forth. So for any given specified
**[54:50]** total energy, this was the amplitude of the
particle and the particle moves back and forth
**[54:54]** here; when it is here, it is all potential
energy; when it is here, it is all kinetic
**[54:59]** energy, because a potential is 0; and when
it is here, its again all potential energy;
**[55:05]** it moves back and forth, and this was simple
harmonic motion. And then, we found the corresponding
**[55:10]** phase trajectories; so here is q and here
is q dot; we found these phase trajectories
**[55:18]** was simply ellipses, concentric ellipses.
What happens if I took this potential and
**[55:33]** inverted the sign? So this is an inverted
parabola. What would this motion look like?
**[55:44]** Let us try to guess. So here is q dot, here
is q, if the particle starts with q equal
**[56:02]** to 0 and q dot equal to 0, it stays there;
it stays there, because there is no change
**[56:10]** any more.
**[56:10]** Remember the equations of motion, always.
So the equations of motion are q dot is v
**[56:16]** and v dot is equal to minus v prime of q over
m. So if it starts at the origin with zero
**[56:30]** velocity, if this is 0, then and that 0; this
is an extremum of the potential; the maximum
**[56:35]** of the potential at the origin. Therefore,
this quantity is 0 and that is 0 to start
**[56:40]** with here. Therefore, neither q nor v can
change with time, because both the derivatives
**[56:45]** are 0 to start with and remains 0. So the
particle would remain here at this point.
**[56:55]** On the other hand, if you start it with a
slight positive velocity at this point, what
**[56:59]** would happen? It would just roll down this
hill and escape to infinity. If you start
**[57:06]** it here with a slight negative velocity, it
will roll down this hill and escape to minus
**[57:11]** infinity. Does this correspond to periodic
motion? The motion, there is no periodic motion
**[57:18]** here at all. Therefore, the trajectories cannot
be closed phase trajectories.
**[57:24]** So what would they look like? What would they
look like? They would look like hyperbolas,
**[57:33]** and you can do that very easily, because in
this case we know that the equation of motion
**[57:38]** says that one-half... let me just write q
dot q dot squared minus 1 q squared equal
**[57:48]** to constant; the total energy. Now, that thing
suggests immediately that this is a hyperbola.
**[58:01]** You know x squared minus y squared equal to
constant hyperbolas, family of hyperbolas
**[58:04]** and they are not closed curves, they are open
curves. What do they look like? What would
**[58:13]** they look like here? So think physically.
I start at this point at q equal to 0, but
**[58:24]** I give it a slight initial positive velocity.
So I am really here, at this point, and then
**[58:31]** q increases as a function of time. What happens
to q dot? It also increases in the forward
**[58:42]** direction. So where does this guy go? Goes
off in this fashion. Now what happens if I
**[58:50]** start here and push it to the left? q decreases.
Then what happens? So what should I draw?
**[59:07]** So we are here and then where does it go?
It goes from here in this fashion.
**[59:18]** What happens if I start at infinity and give
just enough energy to crawl up this well and
**[59:23]** reach this point? What would then happen?
Well it would crawl up here and end here.
**[59:34]** Then, of course, if it stop exactly at this
point. If I gave it a little more energy,
**[59:42]** it would go with the barrier to the other
side. So what is the complete set of phase
**[59:46]** trajectory look like? They are only half trajectories.
What would complete set look like? You must
**[59:54]** look at all possible initial conditions. By
the way, the motion on this, goes in this
**[59:59]** direction, goes in this direction. These would
getting completed, so you would have this
**[60:11]** is part of a half trajectory, gradiates like
this, in this fashion; it is a families of
**[60:25]** trajectories.
I would like you to tell me if this is correct
**[60:30]** - If this picture is correct - and to complete
this phase portrait. The full set of phase
**[60:36]** trajectories, all different kinds of phase
trajectories is called the phase portrait.
**[60:40]** And the phase portrait for the simple harmonic
oscillator was very simple; it was just family
**[60:45]** of concentric ellipses. The phase portrait
for this inverted parabolic potential does
**[60:50]** not have any close trajectories. No periodic
motion, it consists of hyperbolas, but you
**[60:55]** have to tell me what these hyperbolas look
like.
**[60:58]** The other thing you have to tell me, is whether
you could have negative energies in this problem.
**[61:02]** It has no motion corresponding to a negative
energy in this problem. Remember if I took
**[61:08]** any total energy to be negative, and this
is the potential energy, this would imply
**[61:14]** the kinetic energy is negative, which is not
possible, because that is a square of the
**[61:18]** velocity. So, no physical motion happens for
less than for e less than 0; equal to 0 you
**[61:25]** are at the equilibrium point and e greater
than 0, you have physical periodic motion.
**[61:31]** In this problem, in contrast, you could have
e less than 0; you could have a total energy
**[61:37]** which is this and this implies that it could
be anywhere in space, in coordinate space,
**[61:47]** except between these two points, because between
these two points if this is a total energy,
**[61:53]** and that is the potential energy, the kinetic
energy is negative, which is not allowed.
**[61:59]** So this would be the allowed region for you,
either on this side or on that side, but for
**[62:05]** e greater than 0, you can be anywhere.
Pardon me. So this is what I would like you
**[62:14]** to complete. You need to complete in this
problem a typical phase trajectory for e less
**[62:20]** than 0, the phase trajectory or trajectories
for e greater than or equal to 0, and the
**[62:26]** phase trajectory for e greater than 0. So
you need to complete that and this not altogether
**[62:33]** trivial. There are three possible kinds of
e negative, positive, as well as 0, and when
**[62:42]** e is 0, remember, you can have a trajectory
which corresponds to just this point.
**[62:48]** But you could also have other trajectories,
because if you put e equal to 0 on the right
**[62:54]** hand side it says q dot squared, apart from
constants, is equal to q squared. Therefore,
**[63:00]** q dot is plus or minus q with a certain slope;
these are lines which go through the origin
**[63:06]** asymptotically and we will see this, what
happens. So already you begin to see, that
**[63:13]** the phase plane analysis is much more powerful
than trying to solve the equations of motion,
**[63:17]** but at the same time it tells you the difference
between qualitatively different kinds of dynamical
**[63:24]** behavior, some of which would be stable, some
would be unstable, and so on.
**[63:29]** Now, we take it from this point next time,
where we will complete this phase trajectory,
**[63:34]** this phase portrait, and then see what happens
in higher numbers of degrees of freedom. And
**[63:39]** the other thing I would like to do is to show
you that in this particular problem, in the
**[63:43]** case of the single simple harmonic oscillator,
there is a very simple dimensional argument,
**[63:47]** which will tell you that the time period is
independent of the amplitude. Of course, as
**[63:53]** a caution, there are the potentials which
would do this, but they are much more complicated
**[63:56]** and I will introduce a few of them as we go
along.