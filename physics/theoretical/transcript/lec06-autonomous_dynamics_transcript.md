# Mod-01 Lec-06 Autonomous dynamical systems (Part 2)

Channel: nptelhrd
URL: https://www.youtube.com/watch?v=oreXK3P6k30&list=PL5E4E56893588CBA8&index=7

## Transcript

**[1:07]** Let me start by answering this question at
course last time, namely the statement, the
**[1:15]** matrix L which has a set of Eigen values,
lambda 1, and lambda 2, etcetera. In the two
**[1:22]** by two cases, we discovered that these Eigen
values which control the behavior of linear
**[1:27]** dynamical system were determined by just two
combinations, the trace and determinant of
**[1:34]** L. And the physical reason was that the Eigen
values are independent of similarity, they
**[1:42]** are invariant under similarity transformations.
And I will explain what this has to do with
**[1:48]** the way the dynamical system looks like as
a function of time, but before I do that,
**[1:53]** I would like to ask answer this question at
course the last time, what would be the corresponding
**[1:59]** analog for a (N by N) matrix?
**[2:03]** If you have a N by N matrix, and the dynamical
system is x dot is f of x, and this is linearised
**[2:21]** in the vicinity of a critical point, which
let me take through the origin for example,
**[2:26]** this is linearised near the C P at x equal
to 0, and this goes to L times x, where L
**[2:44]** is the Jacobian matrix. And the question is,
if L has Eigen values lambda 1, lambda 2,
**[2:55]** up to lambda N, then the solution to this
equation here, is generally each component
**[3:04]** of x is going to be a linear combination of
e to the power lambda i t, where i runs from
**[3:10]** 1 to N.
And depending on whether the lambda i’s
**[3:13]** have positive real parts or negative real
parts, the flow is going to be away from the
**[3:18]** critical point or towards the critical point,
and we can start defining stability, asymptotic
**[3:21]** stability and instability. So, the question
is what does it depend on, what do the Eigen
**[3:28]** values depend on, what invariant combinations
do the Eigen values depend, for the N by N
**[3:36]** matrix, for the two by two we saw that it
depended only on the trace and the determinant,
**[3:41]** what does it do for (N by N), any guesses,
what should it be?
**[3:51]** Well, cofactors not quite not quite remember,
these Eigen values have to be independent
**[3:59]** of making a similarity transformation on L,
so if you change L to L prime which is S L
**[4:05]** S inverse, where S is a non singular matrix,
the Eigen values should not change.
**[4:12]** The trace yes, it will certainly depend on
the trace, because the trace does not change
**[4:15]** under this, nor does the determinant, but
what else you need n of these combinations
**[4:22]** The trace of L square and then
L Q in the that is true, that is the answer
**[4:29]** because, these are invariant combinations,
because suppose you can pretend for a minute
**[4:34]** you can diagonaliz this matrix, and once you
diagonaliz this the matrix looks like lambda
**[4:41]** 1, lambda 2, and lambda 3 and so on. And the
matrix square looks like lambda 1 square,
**[4:45]** lambda 2 square and so on, cube looks like
lambda 1 cube and lambda 2 cubes, and the
**[4:50]** sums of all these combinations are independent
of making a similarity transformation.
**[4:55]** So, the linear combination the invariant objects,
these things depend on T 1 equal to trace
**[5:09]** l, T 2 equal to trace L square, T N equal
to trace L N, those are the combinations;
**[5:21]** I leave it to you as a trivial exercise to
show that in the two by two case, you can
**[5:27]** always write the determinant in terms of trace
L square, and trace L the whole square, always
**[5:34]** write in a d minus b c in that form. So, the
determinant these are in fact the invariant
**[5:40]** combinations; now what is the meaning of saying
that it is invariant under similarity transformations,
**[5:45]** let us look at the two by two case.
**[5:47]** We saw for instance let me take a simple example,
we took an example where you had x dot equal
**[5:54]** to x, y dot equal to minus y for instance,
this was saddle point. Because, its already
**[6:02]** in a diagonal form and the critical point
at the origin is a saddle point, because the
**[6:07]** Eigen values are plus 1and minus 1 to real
Eigen values of opposite sign, and you immediately
**[6:12]** have a saddle point. Now, what does the face
trajectories look like, here is y and here
**[6:18]** is y things are going to flow in the y direction,
but flow out in the x direction, and therefore
**[6:23]** this is what the trajectories look like; this
was the saddle point. Now, of course in the
**[6:32]** more general case, you would not have a case
where x and y are decoupled in this fashion,
**[6:37]** but you really would have something looks
like x dot equal to a x plus b y, y dot is
**[6:44]** c x plus d y, and we assume that the matrix
a b c d, if it has one positive Eigen value
**[6:53]** and one negative Eigen value, you have a saddle
point very similar to this picture.
**[6:57]** But, the flow is not going to look like this,
it is not going to look like this, at all
**[7:02]** its going to look a little more complicated,
and my assertion is that it is just going
**[7:07]** to be distorted version of this, because you
see in principle I can only change variables,
**[7:13]** I could call u equal to a x plus b y and v
equal to c x plus d y and u and v are linear
**[7:19]** combinations of x and y. And therefore, in
the u v co-ordinate system you would have
**[7:26]** very simple equations of motion, but what
does what do u and v look like in the x, y
**[7:31]** co-ordinate, system two straight lines.
**[7:35]** So, in the x, y plane this could be the straight
line u equal to 0, and this could be the straight
**[7:41]** line v equal to 0, so it is just going to
oblique coordinates nothing more than that,
**[7:48]** a linear transformation which keeps the origin
unchanged, and then you have oblique coordinates.
**[7:53]** Now, how do oblique co-ordinates come up from
rectilinear coordinates, obviously you should
**[7:58]** share the axis. And now my statement is any
two by two matrix of the form a b c d can
**[8:07]** always be written as a combination of three
kinds of transformations, one of them is rotation
**[8:13]** the plain rotation, so let us pictorially
draw this how I get to these axis from the
**[8:19]** Cartesian axis.
**[8:20]** Well to start here, and you take as little
square here, and you rotate the square rotation
**[8:29]** matrix, which is an orthogonal matrix, two
by two orthogonal matrix with determinant
**[8:33]** plus one; then this shape is going to look
like, this is what it is going to look like
**[8:41]** in the rotative coordinate system. And now
you could also dilate, you could also magnify
**[8:47]** one direction, and contract the other directions
for , you can always the change the scale
**[8:52]** of x and y. If you did that this picture would
perhaps look like, after you change the scale
**[9:03]** in the x direction and new co-ordinate directions,
it would look like this.
**[9:07]** And finally you could shear the whole thing,
and then this would look like, this is the
**[9:23]** most general distortion that you can inflict
on a small square here to start of, so if
**[9:29]** I start with the x square in the x y plane
and change co-ordinates to a x plus b y, c
**[9:33]** x plus b y this square would get distorted
in to a shape at this kind. There is no reason
**[9:39]** why, you should have the same area, because
there is no reason why a b c d this matrix
**[9:44]** should have determinant 1, if it had determinant
1 then the area is preserved, so in general
**[9:48]** the determinant is some number, which you
take to be non-zero and it would be in general
**[9:52]** form like this.
So, my statement is a general linear transformation
**[9:58]** in the plane, which leaves the origin unchanged
a linear homogeneous transformation, can be
**[10:04]** though of being made of rotation a dilation
and a shear, we must fix parameters, we has
**[10:15]** make sure we have the right number of parameters.
**[10:17]** A general matrix looks like this, so I start
with x y and I go to a x (a b c d) applied
**[10:25]** on x y which gives me these two combinations,
so how many parameters are here, four parameters
**[10:31]** four real parameters, and we have assumed
(a d minus b c) is not equal to 0 . So, whatever
**[10:39]** we do, however we write this matrix as a succession
of transformations, we must make sure that
**[10:46]** the number of parameters has not changed,
so it should be four; how many parameters
**[10:52]** do you need to specify a rotation on the plane,
one, just an angle some angle.
**[10:59]** How many do you need to specify a dilation
of this kind to contract one direction expand
**[11:05]** the other arbitraries, so that the two more
parameters, if three have gone there and finally
**[11:10]** you need one more to tell you to what angle
do you shear, you shear one of these directions,
**[11:17]** so fix this hole and shear and then the question
is through what angle. So, there is one more
**[11:22]** parameter and therefore, the same four parameters,
this is not a unique decomposition, you can
**[11:28]** do this in many, many ways, you can do this
in different orders and so on, but the number
**[11:33]** is fixed.
**[11:34]** So, let me write this a side general linear
transformation, linear homogeneous transformation,
**[11:49]** because I should be change the origin, I am
not adding constants to the whole thing, I
**[11:52]** am not saying you have the new co-ordinates
a x plus b y plus alpha and c x plus d y plus
**[11:59]** that would mean even the origin is shifted.
I am not taking about the transformation of
**[12:03]** that kind, that is called an affine transformation,
but I am talking about something where the
**[12:08]** point is fixed, the origin is fixed, and then
I do the most general thing.
**[12:13]** And this transformation can always be written
as a combination of rotation plus a dilation
**[12:21]** plus a shear, you need not dilate both you
could say I am going to keep one of them fixed,
**[12:33]** but then you could shear about both the axis,
both directions; so you could put two shear
**[12:36]** angles, and one magnification or demagnification
factor. It does not matter the number of parameters
**[12:43]** is still four, the fancy way of saying is
that the general linear group in two-dimensions
**[12:51]** it is called g l 2 r, r for real this has
four parameters. And this group can always
**[12:59]** be written in terms of rotations, dilations
and shear. But what does it tell us physically,
**[13:05]** what does it mean, it means that once I solve
this problem in which x and y have decoupled,
**[13:11]** and the general saddle point figure is going
to be just a distortion of this figure here.
**[13:17]** And that distortion would mean, that the most
general thing I have would look like this,
**[13:24]** this would really in the most general case
look like this, this is what a saddle point
**[13:42]** will look like in general, some distorted
figure. And the rest is detailed, what the
**[13:48]** action shape is and so on is relevant, but
those two in some sense topologically equivalent,
**[13:54]** in the sense that I can deform one to the
other, in a smooth way and therefore, once
**[14:00]** I studied this, I do not have to study each
saddle points separately, it is just a distortion
**[14:05]** of what the original simple case was.
**[14:08]** So, that is the reason I said, let us look
at the simple cases and then the general case
**[14:12]** actually automatically handle, what happens
if you had for example a center, well in a
**[14:21]** center you have going to follow this going
around, you could distort it, so it would
**[14:25]** look like a strange kind of distorted oval,
but it would look topologically more or less
**[14:30]** the same. In the original case what would
the node look like, what was originally very,
**[14:36]** very neat and unstable node for instance look
like this, and then similarly on this side,
**[14:58]** this picture here, again imagine taking these
axis sharing them etcetera in some crazy fashion.
**[15:03]** So, you could have this may be this is the
only direction, and everything else flows
**[15:11]** from there etcetera, must be all meeting at
that point just be the distorted distortion
**[15:35]** of the original shape. So, we wo n0t spend
more time on this depending on the problem,
**[15:41]** you can recognize whether the critical point
in the two by two case is a node, stable or
**[15:48]** a unstable node, stable or a unstable spiral
point, a center or a unstable saddle point,
**[15:58]** these are the only possibilities that you
have. Of these the only one that leads to
**[16:06]** periodic motion, that corresponds to periodic
motion is the center, everything else does
**[16:11]** not have this behavioral at all, but there
is something more there is something special
**[16:16]** about centers and saddle points, which we
saw by example.
**[16:19]** And that was whenever we looked at potentials,
whenever we looked at particle moving in a
**[16:23]** potential, we ended up as critical with critical
points, which were either saddle points corresponding
**[16:29]** to maxima of the potential unstable equilibrium
or centers corresponding to minima of the
**[16:36]** potential. This is a general characteristic
to turn out that, what we are going to call
**[16:42]** conservative dynamical systems specifically,
Hamiltonian systems I will explain what that
**[16:48]** means, the only critical points possible are
centers and saddle points, you cannot get
**[16:53]** the other varieties, which you get or what
you are going to call dissipated systems.
**[16:57]** So, now we are going to start making the distinction
between conservative and dissipated systems,
**[17:02]** so let us do that right away in a general
context and then come back problem of particle
**[17:08]** in a potential. I should point out, when I
am doing that right away that if you had a
**[17:14]** three by three case, the kind of critical
points that you could have could be very,
**[17:18]** very different, could be quite its actually
enlarged, when you go to four dimensions five
**[17:24]** dimensions etcetera, four or five variables
it can get quite .
**[17:27]** Let us look at just three, look at the possibilities
**[17:31]** Suppose in three variables, the origin is
a critical point then you could have a situation
**[17:38]** which is unstable as a node, that means the
flow is outwards from this point everywhere
**[17:43]** or a stable node everything falls in. But
you could also have this crazy possibilities,
**[17:47]** if this is the x axis, y axis, that is the
z axis, you could have a saddle point in which
**[17:54]** in which two directions flow in and in one
direction it flows out; there will still be
**[17:59]** a saddle point, so it could have this, and
in this direction things flows out.
**[18:05]** So, on this plane you would have flow like
that, in this fashion and then from the other
**[18:11]** direction also you would have flow like this
etcetera that would still be a saddle point;
**[18:19]** it could have even crazier possibilities,
and this happens very often. You could have
**[18:25]** a situation in which two of the Eigen values
form a complex conjugate pair, so you have
**[18:32]** lambda 1, 2 equal to some lambda plus or minus
i mu and let us say this is less than 0 just
**[18:41]** to give an illustration. And the third Eigen
value lambda 3 could be the positive Eigen
**[18:47]** value greater than 0, remember in the three
by three with real coefficients, you can have
**[18:52]** only one complex conjugate pair of Eigen values,
the third have to be real, you cannot have
**[18:58]** three complex real values, because they have
to occur in complex conjugate pairs.
**[19:04]** What happens in a situation like this, well
if you did not have this direction the three
**[19:08]** directions at all, then it is clear that you
have a stable spiral point things are flowing
**[19:15]** into the origin, in the x y plane, but in
the z plane they are going off. So, it could
**[19:19]** have this, you start off like this and it
flows in, but in the z direction it flows
**[19:23]** off; so only they spiral into this critical
point, and the z direction takes off becomes
**[19:30]** unstable.
If the system is non linear then you could
**[19:34]** have the following picture this goes off a
long distance, and then flows out and then
**[19:39]** gets re-injected into this plane and repeatedly
keeps doing this, this mechanism leads to
**[19:44]** something called homoclinic chaos. So, this
is typical mechanism by which you have high
**[19:50]** dimensional flows, in very complex dynamic
behavior, so things of this kind can happen,
**[19:55]** we will come back some of these.
**[19:58]** So, let us define now, what we mean by conservative
versus dissipated dynamical systems, it is
**[20:21]** a useful classification not a very significant
one in certain respects, but the one that
**[20:25]** I am going to make now, is going to be applicable
directly to Hamiltonian clause, which we would
**[20:30]** look at. What do I mean by conservative dissipated
systems, let us look at our general case,
**[20:36]** we have in mind a situation where an N dimensional
system is given by a set of equations of this
**[20:49]** kind, this is not necessarily a problem of
a particle in a potential or a set of particles
**[20:56]** or rigid body anything, just a general dynamical
system autonomous.
**[20:59]** Because, there is no explicit time dependence,
the rules here and coupled first order N dimensional,
**[21:07]** N first order differential equations; and
our statement was that if you specify initial
**[21:12]** conditions, the future is uniquely determined
in principle. Phase trajectories in the system
**[21:18]** do not intersect each other, and if a phase
trajectory closes on itself then it is a periodic
**[21:24]** motion, so this much we know. Now, what we
would like to ask is the very crucial point,
**[21:29]** which I am going to very preoccupied with
this, if you start at some point in phase
**[21:33]** space here, and you are on a phase trajectory
of this kind.
**[21:36]** And you start of a neighboring point here,
perhaps due to initial resolution errors,
**[21:42]** I am really never going to be able to specify
the initial point with absolute position,
**[21:47]** then what is the future of this point here.
Common sense would tell us that in regular
**[21:53]** systems or nice systems, these two do not
go too really go very far apart make a small
**[21:58]** error in the beginning, you stay with this
error gets multiplied by a factor of two,
**[22:03]** but it stays negative.
On the other hand, most dynamical systems
**[22:07]** do not behave in this fashion, normally in
dynamical systems; do not behave in this fashion
**[22:12]** at all. What really happens is, if you start
here you end up there, and if you start here
**[22:17]** you may end up there. And the future can be
very, very different the error in initial
**[22:24]** state or the resolution finite resolution
it shows that two neighboring trajectories,
**[22:31]** can actually separate as a function of time,
and the question is how fast do they separate,
**[22:36]** well if they separate exponentially fast in
time, then in general there is no way you
**[22:42]** can compute these things.
Because, if I start with some initial point
**[22:46]** to some error, some accuracy and I would like
to predict the future, I would certainly like
**[22:51]** to know, whether I am in that trajectory up
there or down here, and if the error amplifies
**[22:56]** exponentially in time, and this is not going
to be computable after certain amount of time.
**[23:01]** If at every time step the error doubles for
example, right then after n time steps its
**[23:06]** 2 to the power n of the original error, which
you can write as either the n log 2 times
**[23:11]** to the original error.
So, exponentially grows with time, then in
**[23:17]** binary for instance if in the million decimal
place, if you made a initial mistake, after
**[23:21]** million iterations you are in the first decimal
place; this is what chaos’s.
**[23:25]** And this is why it is a serious problem, and
we have to deal with it, it exists its very
**[23:30]** real and most systems r chaotic in the sense,
and we have to deal with it, so we will see
**[23:35]** what should do about it. But for the moment
the reason I brought that was, because we
**[23:40]** have preoccupied with finding out what happens
to not a single initial condition, but a set
**[23:46]** of initial conditions, I start with a set
of initial conditions, some neighboring initial
**[23:51]** conditions, some volume element in phase space.
And each of these points goes off into a trajectory,
**[23:58]** and the question is what happens after some
time to this little volume element, now this
**[24:03]** is the question we would like to ask, well
let us do that in the following way.
**[24:07]** So, this is what x 1 dot is at a given point
x, and there could be a neighboring point
**[24:16]** here, let me call that x plus delta x. And
I am interested in knowing what happens, if
**[24:24]** you have a whole volume element here what
happens to this volume element as a function
**[24:30]** of time, then I could also write x plus delta
x 1, the dot of that this is f 1 of x 1 plus
**[24:42]** delta x 1, x 2, up to x N, so instead of x
x 1 I start with x 1 plus delta x 1. Now,
**[24:54]** I say here, I have x here, I start with x
2 instead of x 2 plus delta x 2, the next
**[25:01]** variable and so on. So, I imagine that I am
here, in three dimensions for example I can
**[25:23]** do this very easily, for all n cube of that
kind and I call this the one direction, that
**[25:34]** the two direction and inside the three direction.
This is x, x 1, x 2, x 3, this is x 1 plus
**[25:42]** delta x 1 and x 2, x 3 as they are, this is
x 1 x 2 plus delta x 2 and x 3 as it is, and
**[25:51]** this point here in 5 corresponds to change
in x 3 by delta x 3 leading x 1, x 2 and x
**[25:57]** 3. So, look at each of these and write down
the evolution equation, but you see this could
**[26:04]** also be written the first order in delta x
1, by expanding this function and if I tell
**[26:12]** you expand it, this is the original f 1 of
x plus a partial derivative of this function
**[26:20]** with respect to x 1 evaluated at the point
x multiplied by delta x 1; so this is delta
**[26:27]** f 1 by delta x 1 evaluated at the point x
my original point
**[26:42]** and so for each of these.
Therefore, I could ask what is d over d t
**[26:52]** of the product delta x 1 delta x 2 delta x
N, that is nothing but, d over d t of delta
**[27:01]** v the volume element in phase space. That
is just the product of all these delta x,
**[27:07]** and ask what is the rate of change of value
that, equal to this and this is equal to well
**[27:15]** by the chain rule its d over d t delta x 1
right, times all these plus delta x 1 times
**[27:24]** d over d t delta x 2 and so on.
That we can find by subtracting from this
**[27:29]** equation, the original equation x 1 dot is
f 1 of x 1 x 2 etcetera, and that immediately
**[27:35]** says this goes away, this function here is
cancelled and you get just is, the first order
**[27:44]** in delta x 1 says this, because the original
f 1 at this point is cancelled out and so
**[27:54]** on, for each of these therefore, we end up
with delta f 1 over delta x 1 times delta
**[28:02]** x 1 multiplied by delta x 2 delta x 3 etcetera.
**[28:07]** So, each time the corresponding delta x obligingly
comes out, you can take that out common this
**[28:14]** becomes delta f 2 over delta x 2 times delta
v itself, I have rewritten delta x 1 through
**[28:29]** delta x N, as delta x. But what is this, what
does this combination remind you all remember,
**[28:40]** f 1 f 2 are the components of a vector; and
x 1, x 2 are the coordinates in phase space.
**[28:46]** And let us take the first component differentiate
with respect to the first coordinate etcetera,
**[28:51]** and sum all these and what is this called?
**[28:54]** It is the divergence of this vector field,
so this quantity is nothing but, the divergence
**[29:00]** del dot f remember, the del operator is just
a vector with components delta over delta
**[29:10]** x 1, delta over delta x 2, up to delta over
delta x N, as you would expect this is the
**[29:29]** geometry of the divergence. So, when is this
0, when can you assert that an arbitrary element
**[29:40]** in a phase space for a given flow really does
not change in volume, that volume remains
**[29:45]** the same.
Then the divergence of x is identically 0,
**[29:49]** so if this vector field f has 0 divergence,
then you can assert that the volume element
**[29:56]** does not change, and I would call it as conservative
dynamical system.
**[30:00]** It preserves the volume in phase space, in
phase space always preserved; and I would
**[30:37]** call this conservative 
that is my definition. Of course, in mechanical
**[30:57]** context you are more used to say that the
energy is conserved, we will see how that
**[31:02]** is connected to this a little later, it is
connected in a little intricate way.
**[31:09]** That is just one kind of conservation, mechanical
systems could have other conservation laws
**[31:14]** angular momentum could be conserved, linear
momentum could be conserved and so on, the
**[31:19]** energy is very, very special as we will see.
And the conservation of energy in Hamiltonian
**[31:25]** systems, it is directly linked to the fact
that volume elements in phase space do not
**[31:29]** change, we will see that; but, this is in
a general context we have not even talked
**[31:33]** about mechanical systems.
I would like to define a conservative system
**[31:36]** as one for which this vector field f has 0
diversions, what happens if you look at the
**[31:46]** simple harmonic oscillator for instance, would
you think that conserved, we have to check
**[31:52]** this, we have to specifically see whether
this is true or not. I would expect that in
**[31:59]** problems things are conserved, so let us see,
if this is true in phase space, I have not
**[32:05]** defined my phase space too well, but purpose
but let us see what happens.
**[32:09]** You have x dot equal to v and m v dot equal
to f of x, which is minus v prime of x or
**[32:21]** a potential problem, and the question is is
the volume element conserved in this case
**[32:30]** or not, what would you say, this problem x
1 is just say x. And x 2 is v this is f 1,
**[32:48]** and you have to differentiate it with respect
to x, does it have x dependence no, there
**[32:54]** is no x dependence its v, it is a independent
dynamical variable, does this have any v dependence;
**[33:03]** so each of these terms is 0, this is 0, that
is 0.
**[33:07]** Of course its conservative this is trivially
so, its trivially conservative, I put a little
**[33:18]** bit of damping what happens then, remember
that damped harmonic oscillator was written
**[33:24]** in this form, what happens now, to this divergence
of this term, the second term minus m gamma
**[33:37]** v has v dependent, and you have to take its
partial derivative with respect to v. What
**[33:41]** happens then, minus very important, minus
m gamma minus, you pluck that in here and
**[33:50]** what does it say it says d over d t of any
volume is negative a negative number constant
**[33:57]** times delta v.
What does that mean, delta v.
**[34:01]** It shrinks to a point, and indeed this is
true for dissipated systems things will shrink
**[34:06]** because, remember that the phase trajectory
is now would be spirals, for the under look
**[34:13]** like this and things would fall in.
So, if I started with a big volume element
**[34:17]** here, and ask what the set of points does,
they all have to fall into this point here
**[34:21]** finally and therefore, the volume element
shrinks as a function of time. The fact that
**[34:28]** del dot f is negative, if it takes care of
that says globally everything shrinks everywhere
**[34:34]** of course in such cases, where there are situations
in some parts of things could expand and other
**[34:40]** parts they could contract and so on, that
would not be a conservative system by our
**[34:44]** definition.
If del dot f is identically 0, then I call
**[34:48]** it a conservative system and also see that
if del dot f is indeed negative everywhere
**[34:54]** then things are really shrinking, this must
be a very dissipated system, in shrinking
**[34:58]** of some point. Let us look at an example,
very far from remote mechanical examples,
**[35:04]** just for a illustration see what happens here,
this is a very, very simple model, but it
**[35:10]** will tell us why we should expand our definition
a little bit. I should mention that del dot
**[35:17]** f not equal to zero I call a dissipated system,
and in general I am going to be interested
**[35:21]** in del dot f negative meaning contraction.
Because these things expand if the phase space
**[35:26]** is finite they cannot go beyond the boundary
in any case unless the phase space is infinite
**[35:31]** in which case things could expand forever,
but that is not very interesting to me. We
**[35:35]** are going to always worry about cases where
you have dissipation things would shrink,
**[35:41]** but I must warn you right away that in general
the complicated system would have some regions
**[35:47]** of phase space where things could shrink other
regions could expand, and yet other regions
**[35:51]** could move in a very complex way.
**[35:55]** Let us look at another problem, another example
this is called the Lotka-Volterra, it is an
**[36:09]** extremely simple model of population dynamics;
and it has to do with two species of animals,
**[36:17]** which are supposed to have sufficiently large
numbers that you can right on differential
**[36:20]** equations for that population, as supposed
to be differential equations.
**[36:24]** Because, the population is always an integer
and non negative integer, but I am going to
**[36:28]** pretend that you have large numbers therefore,
you could write down differential equations,
**[36:31]** for these problems. Let us call them typical
case foxes and rabbits, so you have rabbits
**[36:38]** running around and as you know rabbits have
a proclivity to breed, and let us call the
**[36:43]** population of rabbits at any instance time
x, and x dot is than going to go, because
**[36:49]** there is plenty of grass and they eat grass
there is plenty of grass and they would grow.
**[36:55]** And they would grow at a rate, at a certain
birth rate alpha depending on the current
**[36:59]** population x and this is exponential growth,
so the solution is going to be e to the alpha
**[37:06]** t times x 0, then any positive x of 0 is going
to be an explosive tone. On the other hand,
**[37:14]** suppose there are foxes and let us call them
y, these foxes do not eat grass, they eat
**[37:22]** rabbits but, if there are no rabbits around
then of course, they would just die and the
**[37:26]** death rate would be some gamma y.
So, we can draw phase diagram in this problem
**[37:35]** we really need only the first quadrant because,
populations cannot be negative but, mathematically
**[37:40]** you can look at both positive and negative
x and y, and it says it would just come down
**[37:45]** here, and these fellows would just grow off.
And these already suggested that this is an
**[37:49]** unstable equilibrium point, because infinitely
near it things flow out.
**[37:56]** Now, we put a coupling between these two,
and this say
**[38:02]** Well I am saying that foxes, if you do not
have any food would die out
**[38:08]** The total number of the rate at which the
population decreases would depend, if there
**[38:16]** is a death rate 2 per 100 and the population
is 2000, then the death rate is going to be
**[38:24]** the number of deaths is going to be rate multiplied
by the current population right, so this is
**[38:30]** the rate at which the total population is
decreased. Therefore, it is proportional to
**[38:34]** the current population multiplied by some
constant death rate, if there is no interaction
**[38:39]** at all, so this is what the phase diagram
looks like.
**[38:43]** But, now let us suppose now that the foxes
are allowed to eat the rabbits, then clearly
**[38:49]** the rabbits are going to suffer a loss so
minus sign, and it is going to depend on how
**[38:55]** many foxes there are, but the rate at which
it is going to happen is going to depend on
**[38:59]** how many foxes there; the more foxes the faster
the rate of depletion. Therefore, this is
**[39:06]** some beta times x y, the rate of depletion
of foxes of rabbits here is going to be beta
**[39:14]** y, is going to depend on y in this fraction
similarly, these are going to increase now,
**[39:21]** because they are able to eat.
**[39:23]** And this is going to be some delta x y, the
rate at which they grow is delta x, so these
**[39:31]** are two species it is called the predator
prey model, and now you can see a coupling
**[39:51]** has been introduced between them, and the
question is where are the equilibrium points
**[39:55]** defining, 0 is certainly a equilibrium point.
And now by our rule, if you linearise near
**[40:06]** 0 it means you throw away the non linear terms,
keep only these terms, then since all these
**[40:12]** rates alpha, beta, gamma, delta, are positive
by definition. It is clear you have one positive
**[40:17]** Eigen value, one negative Eigen value, therefore
this must be a saddle point here, this is
**[40:22]** a saddle point.
The question is, is there any other critical
**[40:28]** point, so what is it like, what does it do,
let us make life simpler, I am going to lead
**[40:33]** you to analyze the more complex problem, and
put all these constants equal to 1, just for
**[40:40]** illustration put all these constants equal
to 1; then you could write this as x times
**[40:45]** 1 minus y and you could write this as y times
x minus 1. So, are there any other critical
**[40:59]** points, are there any other values of x and
y where the whole thing vanishes, 1, 1 1,
**[41:09]** 1 is a critical point, so you have another
critical point here. Now, would like to know
**[41:18]** what sort of critical point is it, what you
should do is to actually linearise about that
**[41:25]** point.
So, you should really say I am going to look
**[41:28]** to first order, I must find this matrix l,
so the way Ii do it is by saying,
**[41:33]** let us set let u equal to let x equal to 1
plus u and y equal 1 plus v, so I shift my
**[41:44]** origin to this point here, and then ask what
do the equations look like in this case. What
**[41:51]** does it look like, that is right this is x
minus x y, and this becomes 1 plus u leave
**[41:59]** it in the original form, x minus 1 minus y
is equal to 1 plus u multiplied by 1 minus
**[42:09]** y which is minus v.
Therefore, this is equal to x is equal to
**[42:21]** plus u and 1 minus u is minus v, so u minus
v and this is equal to this is minus y, so
**[42:32]** minus 1 minus v, y is 1 plus v multiplied
by x minus one which is u sorry, u plus u
**[42:49]** v, and this is u minus v minus u v, it has
to be non linear you cannot just make a linear
**[43:02]** change and then get a non linear set into
a linear 1, so there are these higher order
**[43:07]** terms. Now, what does u equal to 0, v equal
to 0, u v axis what does the flow look like
**[43:20]** near it, near this point in this immediate
vicinity you have u dot, because x dot is
**[43:27]** the same as u dot its shifted by a constant,
is minus v and v dot equal to plus u linearizing.
**[43:39]** Now, the matrix L, so this says L equal to
(0 minus 1 1 0), and what are the Eigen values
**[43:52]** of this matrix 
plus or minus i plus or minus i, that is a
**[44:07]** pure imaginary set of Eigen values so what
kind of critical point is it, it is a center,
**[44:13]** it is a center. So, what do their trajectories
look like in its vicinity, they look like
**[44:22]** little circles, because you can integrate
the set of equations trivial to integrate,
**[44:27]** because you write d v over d u is u over v,
and gives you u square plus v square is a
**[44:34]** constant or something.
They are circles in which direction do the
**[44:38]** circles go, would they clock wise or counter
clock wise, they have to have continuity with
**[44:45]** this in between, it is true that you found
this in the vicinity of that point, but there
**[44:50]** is nothing else in between, so it is clear
that they must have continuity with this.
**[44:56]** Therefore, they have to go in this fashion,
there is no option you cannot suddenly change
**[45:03]** directions of course, as you go further away
from the vicinity of the critical point at
**[45:10]** 1, 1 the orbits no longer are circles, they
would get distorted, but they cannot cross
**[45:16]** each other.
So, what its telling you is that no matter,
**[45:21]** where you start at this point I start with
the very large population of foxes, and a
**[45:27]** very small population of rabbits, the foxes
start dying there is no enough food, so they
**[45:33]** come down they die, but as more foxes die,
the rabbits become they have get a impunity,
**[45:39]** they start growing and therefore, the rabbits
expand for a while. But then they get so far
**[45:44]** away that the foxes start eating them once
again, and goes up in this fashion then of
**[45:51]** course, eat too much and therefore, the rabbits
are depleted and they come back.
**[45:56]** So, the full phase portrait this is very irregular
set of curves, but they are periodic is not
**[46:02]** trivial to show at this is true, but I leave
it as an exercise, and we will see a little
**[46:07]** later, you can show this very elegantly, that
this is indeed true, this is what the phase
**[46:13]** trajectories look like, with module of some
distortions.
**[46:15]** So, there is a center here, and there is a
saddle point here, this oscillation was seen
**[46:22]** in the catch of two species of fish in the
1920s by fisherman in the early arctic sea,
**[46:29]** and then the mathematicians Pythagoras solved
this problem; they realized this is what is
**[46:35]** going on they solved this sort of this equations,
and showed that this is the phenomenon. That
**[46:41]** really you have the oscillatory behavior,
the population of predator and the prey they
**[46:46]** are out of phase by a fixed amount here, you
can see that one is large the other is small
**[46:53]** and so on they are out of phase and the reason
for it is precisely buried in this equations.
**[46:58]** Now, is this is a conservative system by the
way mathematically you can solve the set of
**[47:05]** equations for the remaining values of x and
y also, nothing very interesting happens,
**[47:10]** this guy here just looks like this, just looks
like a saddle point here and there interesting
**[47:18]** point is this 1, 1 that is a point of co existence.
That is the point at which the critical values
**[47:26]** of foxes and rabbit populations, at which
they can actually co exist. They have the
**[47:32]** right number of being eaten, and the right
number of foxes dying and things can exist.
**[47:36]** Even though there is a conflict between them
there is peaceful coexistence possible, we
**[47:42]** have not included many, many facts, this is
the simplest possible model we have not included
**[47:48]** competition among the foxes for the same food,
we have not included competition among the
**[47:52]** rabbits for the same food, for the same grass
and so on.
**[47:56]** So, if you include competition among the rabbits
there must be a minus constant times x square
**[48:02]** at the very least, and similarly here too
there would be competition, there would be
**[48:06]** minus something times y square, so that is
predator prey interaction together with competition
**[48:11]** and so on. Then things get much worse, there
is no instantaneous response, once the population
**[48:19]** of rabbits increases it takes a while for
the fox population to catch up, so really
**[48:23]** the fox population growth rate would depend
on the rabbit population at a slightly earlier
**[48:27]** time; and foxes have to eat them, they have
to mature, they have to mature to the breeding
**[48:31]** stage and so on. So, the problem is actually
much more complex much much more complex,
**[48:37]** but already it tells you in this simple instance
that things can get quite interesting, is
**[48:42]** this a conservative system well, we need to
find out, we need to take this.
**[48:50]** So, x minus x y and we have minus y plus x
y and what is del dot f equal to, it is the
**[48:59]** derivative of this with respect to x, that
is 1 minus y plus the derivative of this with
**[49:05]** respect to y, that is 1 minus 1 plus x, that
is equal to x minus y. So, is it conservative,
**[49:19]** not in the strict sense of the word it is
not, but if x is equal to y may be on this
**[49:24]** line, it is certainly true, that the divergence
vanishes, but that is not enough.
**[49:31]** Because the trajectory intersects that line
only twice, but then on the average it is
**[49:37]** conservative, because for every volume element
in which x is bigger than y, it grows del
**[49:44]** dot f is positive here, there is a corresponding
volume element there, where its negative.
**[49:51]** And therefore, over a full cycle if you start
with this little volume element and followed
**[49:56]** it as along here, on the average when you
integrate it out, it would be 0. So, we have
**[50:03]** a slightly more general definition of a conservative
system, if its periodic motion in this case
**[50:07]** is then you should really look at the volume
element, as an average over the full cycle,
**[50:14]** then if it is 0 you will say it is conservative,
not in the rigorous sense of the word but,
**[50:19]** certainly for all practical purposes, you
could regard it as conservative. Well later
**[50:25]** I will show that this system by changing variables
actually is a Hamiltonian system, and the
**[50:31]** fact that you have a center and a saddle,
really tell you that this is writable as simple
**[50:36]** as Hamiltonian system, not a conventional
one, but its writable in that form.
**[50:42]** You could now ask what happens if I have three
species, and I generalize this model then
**[50:47]** the matter is not so simple at all, also some
possibilities are open up, yes.
**[50:59]** No I do not think so, no not to start with,
it is just that this problem with these constants
**[51:04]** is so simple, it is so symmetric it has this
wonderful symmetry about x, about the 45 degree
**[51:10]** line, that is the reason for the special feature
of this, problem here. So, it is not very
**[51:15]** significant that that sense, but its significant
in the following sense, if a system is a Hamiltonian
**[51:21]** system which I have not defined, then by definition
conservative.
**[51:24]** And you might wonder why this system which
is closely related to Hamiltonian system turns
**[51:30]** out to be non conservative, and the answer
is it is due to the changes of the variables.
**[51:34]** So, effectively what ever you start with every
point here, every point in the phase plane
**[51:40]** in the positive quadrant, lies on a periodic
orbit, and across a full cycle the volume
**[51:46]** element does not change; there may be some
reasons, where one of them is winning the
**[51:51]** fox is the winning, the another region rabbits
are winning, but overall nothing much happens.
**[51:56]** So, it is in that sense, I specified this,
so I pointed out this because, this distinction
**[52:01]** of conservative and dissipative systems is
a matter of convenience matter of convenience
**[52:07]** sometimes it has deep physical significance,
and we will see why that is so.
**[52:11]** I should point out that the fact that del
dot f is equal to 0, tells you that the flow
**[52:18]** in free space is that like of a incompressible
fluid, and this is worth appreciating, because
**[52:26]** a fluid flows according to the Navier-Stokes
equations. Now, if you write it down in the
**[52:32]** simplest case, if you write down the equation
of continuity for this fluid, so let us do
**[52:39]** that in half a second.
**[52:41]** In real space a fluid flows with no sources
and shrinks in this fashion, the divergence
**[52:50]** of the current is 0, this is the equation
of continuity for a fluid, it says in any
**[52:55]** volume element, whatever comes in must go
out or else the density changes, this whole
**[53:01]** thing is just a balance equation, nothing
more than that. Now, suppose you have an incompressible
**[53:08]** fluid, rho does not change its constant, in
space and time then this term is 0 identically,
**[53:16]** and del dot j is 0, but what is j which is
del dot its rho times the velocity v equal
**[53:23]** to 0. But, rho is a constant, so this implies
that del dot v equal to 0 right and our f
**[53:41]** was just the velocity of points in free space;
the phase space velocity for the flow in phase
**[53:47]** space.
So, this is the reason why one says, that
**[53:51]** a conservative dynamical system the flow in
phase space is similar to that of an incompressible
**[53:58]** fluid in real space, for which del dot v must
be 0, that is the analogy. So, very often
**[54:06]** you will see this written in text books that
the flow looks like, this state what is called
**[54:10]** Leo wells theorem in Hamiltonian dynamics,
and say this looks like an incompressible
**[54:14]** fluid or the reason is this. But, remember
that the flow that we are talking of about
**[54:19]** is in phase space, it is not a physical flow
of a fluid, but this has its uses, and we
**[54:28]** will see what they are.