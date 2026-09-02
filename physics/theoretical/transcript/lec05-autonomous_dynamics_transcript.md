# Mod-01 Lec-05 Autonomous dynamical systems (Part 1)

Channel: nptelhrd
URL: https://www.youtube.com/watch?v=Vmj54LvrLOA&list=PL5E4E56893588CBA8&index=6

## Transcript

**[1:07]** Let us resume where we left off, remember that our
general N-dimensional autonomous dynamical
**[1:32]** system or specified by set up first order
equations, the vector X stands for a set up
**[1:41]** of N variables, and f is a vector field in
the same dimensional phase space.
**[1:52]** And at each point, the significance of f is
that it tells you the velocity of the point
**[1:59]** in phase space; the dot of the X dot, X is
the position of a point in phase space, and
**[2:06]** X dot is it is velocity change with time.
So, this vector field f specifies locally
**[2:12]** at each point, in what direction the X is
going to change, it is going to increase,
**[2:17]** so in some part of phase space this point
X, if this is the direction of f it means
**[2:24]** in the next instant of time it moves along
here. And at this point, if this is the direction
**[2:28]** of f in next instance of time it moves along
there and so on, and you continuously join
**[2:33]** these little segments, and you can get the
phase trajectory.
**[2:36]** So, this vector filed f has the significance
of being the phase space velocity, velocity
**[2:42]** of a point in phase space, of the representative
point in phase space. And our task is to solve
**[2:48]** this equation, I pointed out that in general
this is not an easy task, because f is a very
**[2:54]** complicated non linear function, which combines
all these variables and intricately mixes
**[2:58]** them up. But if you look at any typical point
local solvability is always possible, and
**[3:07]** the reason is if considered some arbitrary
point X naught to start with, then in the
**[3:15]** immediate vicinity of X naught, I can do Taylor
expansion of this function about the point
**[3:21]** X naught.
**[3:23]** And what would that look like well, if it
were single function if you simply had f of
**[3:28]** x then of course, I write this is f of x naught
plus x minus x naught f prime at x naught
**[3:36]** plus etcetera, this is what I normally do,
if I had as a simple point single variable
**[3:43]** x. If I have a set up variables x 1, x 2,
etcetera; then again I do a Taylor expansion,
**[3:50]** but this is a joint expansion in all the variables.
And for instant if I had two variables, f
**[3:56]** of x, y I would write this f of x naught,
y naught plus there is a x minus x naught
**[4:05]** multiplied by the partial derivative delta
f over delta x at x naught y naught plus a
**[4:16]** term which is prepositional to y minus y naught
delta f over delta y at x naught y naught
**[4:25]** plus higher order terms. The higher order
terms would typically have x minus x naught
**[4:30]** whole squared y minus y naught the whole squared,
and a cross term x minus x naught times y
**[4:37]** minus y naught, and then the partial derivative,
the cross partial derivative and so on. So,
**[4:43]** all you need is to generalize the concept
here to N variables, but in the leading approximation
**[4:50]** very close to x naught, it is clear you could
throw away all terms except the leading term.
**[4:55]** And if you did that then off course, you realize
that this equation becomes x dot equal to
**[5:04]** f at the point x naught plus terms proportional
to x minus x naught itself. And therefore,
**[5:13]** if you are sufficiently close to x naught
it suffices to keep this; if you are arbitrary
**[5:20]** close, very close to x naught; then of course,
this is a constant this matrix here, there
**[5:26]** is no depends on any of the variables, because
it is set up a particular point constant matrix.
**[5:30]** And your back to the old situation, where
you have x dot equal to constant on this side,
**[5:36]** as to we have to solve, because the solution
is simply x equal to the constant times T
**[5:44]** plus at the higher order terms and so on,
so this very, very trivial to solve. And what
**[5:49]** is it imply it is a mathematical way of saying,
if I am here then the leading term all have
**[5:55]** to do is to take this matrix, multiply take
this quantity here, this vector multiplied
**[6:01]** by T and that tells me what x is at T time
delta T, so here at this point.
**[6:10]** And once you are here, you repeat the procedure
and you here and then you here and so on,
**[6:16]** so local solvability is not an issue, no matter
how to complicate this system is locally you
**[6:23]** can always solve this. Here is a rigorous
mathematical way of saying it, and under goes
**[6:28]** by the name of the Rectification theorem;
what it says is, if you have such a function,
**[6:35]** then locally at every point you can find a
change of variables such that, the equation
**[6:41]** is trivial to solve, that is exactly what
you done here. It is the mathematical theorem,
**[6:45]** I might as well write this down it is called
Rectification theorem.
**[6:58]** And in pictures it say the following, if this
vector field f, if the phase trajectory look
**[7:03]** like this for the system, so in initial point
here travels along this trajectory point,
**[7:10]** here travels along that and so on. Then some
neighborhood some place here, some arbitrarily
**[7:16]** small neighborhood of my initial point x naught,
the vector field points in this direction,
**[7:23]** and you go little bit further way, points
some other direction and so on.
**[7:27]** And what the rectification theorem says is,
in a sufficiently small neighborhood of any
**[7:33]** given point, normal point you can find the
change of the variables from the set of a
**[7:39]** variables x 1, x 2 up to x n, to a new set
of variables y 1, y 2, y n, you can change
**[7:51]** variables where the y is a function of the
axes. In such a way, that this same neighborhood
**[7:58]** in y space looks like this, that is all these
vector fields have been rectified in other
**[8:09]** words, in the y variables this set of equations
x 1 dot is f of f 1 of x 1 f x 2 up to f x
**[8:16]** n. would start look like y 1 dot equal to
1, y 2 dot equal to 0 etcetera, up to y N
**[8:26]** dot equal to 0.
And the solution of this is simply that y
**[8:32]** 2, y 3 etcetera remain constant, and y 1 alone
increases linearly with T, and if this is
**[8:37]** the one direction it says only the point 1,
only the first coordinate increases, nothing
**[8:42]** else changes; for this is rigorously establishable,
and that's essentially what we you done
**[8:49]** here by saying to leading approximation this
is constant matrix. But of course you could
**[8:55]** ask what happens next, well point is if you
go to this neighborhood, then that is same
**[9:00]** change of variables would not work anymore,
you need a new change of variables.
**[9:03]** So, from y have to go z or something like
that, that neighborhood here look like this,
**[9:10]** typically the vector field would start looking
like this, and this is how the entire thing
**[9:14]** gets curved as you move along. And the difficult
with this program to implement it for all
**[9:23]** time is to fold, typically what happens is
these changes of variables would applying
**[9:30]** certain neighbor hoods; and it could so happen,
that is keep going you first start here this
**[9:36]** neighborhood, when you go to this point, then
you go to this, then you go to this and so
**[9:41]** on. It is possible that this change of variables
applies in a smaller and smaller neighborhood,
**[9:48]** in therefore finally pitters out to a point,
and the program does not work anymore, this
**[9:53]** is one possibility.
The other possibility is that you go along,
**[9:58]** and make these changes of variables and various
neighborhoods, so both these thing occur,
**[10:02]** both these phenomena actually occur quiet
often, and that is the reason why, local solvability
**[10:08]** is not the same as global integrability. If
I could solve this set of equations explicitly,
**[10:15]** and write everything down as a function of
time then of course, I can make T as large
**[10:19]** as I like, plug it in and get a formula for
the x, and that is global integrability.
**[10:25]** But this is local solvability, locally I solve,
but it cannot be extend to global integrability,
**[10:31]** and this is the problem we will face this
problem as we come along, there is really
**[10:35]** no in general of course, systems are not integrable,
that is the way it is and we have look for
**[10:40]** alternative ways of handling this whole situation.
But, what is interesting is that, in general
**[10:48]** this program would go through at every point
with one exception, when would this program
**[10:53]** not happen, when would this not work, when
would it not be possible to say, this guy
**[11:03]** here is just a constant vector C, this thing
here is some C.
**[11:09]** And this would imply immediately that x of
t is equal to c t plus x of 0, when would
**[11:21]** this not work?
**[11:24]** If f is 0, if f of x naught is 0, then this
program is not true any more, so if the leading
**[11:31]** term in the Taylor expansion is 0, then you
have to get the next order term, and what
**[11:37]** is the meaning of saying that the leading
term a 0, what is the meaning of saying that
**[11:41]** f at some point x naught equal to 0, what
is this mean, it is a vector. And therefore,
**[11:52]** it means every component is 0, and it means
if you are that point, the phase space point
**[11:58]** does not move at all; therefore, it is equilibrium
point or a critical point, more generally
**[12:05]** a critical point.
So, at a critical point when this vanishes,
**[12:10]** when this vector field vanishes, then of course
you have singularity of this vector filed,
**[12:15]** incidentally unlike scalar functions which
would say singular, when they become infinite
**[12:19]** or something like that. For a vector field
you have singularity, even if the field vanished
**[12:24]** at some point, because when you do not know
in which direction it points completely.
**[12:28]** So, even the ordinary vector, the vector r,
the position vector r, at the origin is singular;
**[12:37]** where it is not defined at that point, at
the origin this field is not defined its direction
**[12:43]** is not defined. And if you draw the field
lines of this vector of course, to realize
**[12:47]** immediately y because, the field lines look
like this, at any point things look like this,
**[12:57]** in this radial fashion and of course, of the
origin its indeterminate. So, vector field
**[13:03]** become singular even when they vanish, and
that exactly what happens at a critical point.
**[13:10]** What would you do then, and let me therefore
define this now, let me write this, and I
**[13:35]** abbreviate it with CP. Once you are at a critical
point, and in our mechanical examples, critical
**[13:46]** points correspondence to equilibrium points,
in a more general context, it is just the
**[13:50]** singularity of some kind with various interpretations.
Once you are at a critical point, when this
**[13:56]** program of linear, is this program of rectification
does not work anymore, and you have to go
**[14:02]** to the next term.
And what would that be, so let us suppose
**[14:07]** x naught is a critical point, and might a
critical point and without loss of generality,
**[14:11]** let me take the origin to be at a critical
point, because I could always shift the origin,
**[14:16]** in x without too much trouble in these problems,
so let me assume that I focus on one particular
**[14:21]** critical point, and let me call it for a movement
the origin. So, f of 0 is 0, what should I
**[14:29]** then write, when I do a Taylor expansion,
what should I write.
**[14:41]** What should I write, how do I do a Taylor
expansion in variables.
**[14:53]** I have x minus x naught delta f over delta
x plus y minus y naught delta f by delta y
**[14:59]** plus etcetera, etcetera, this is the first
order term. So, how should I write this in
**[15:04]** general, what should I write it general as...
Well no no, I would like have us compact formula
**[15:13]** for the N dimensional case.
I should something with something, so what
**[15:20]** should I what should I .
x dot gradient, but f is a vector f is a vector
**[15:36]** right, so what should I do, you are right,
so what should I do?
**[15:45]** Are you more comfortable with index notation,
with index notation I mean which ever you
**[15:53]** like, we have x 1, x 2, x 3, so let me call
it x of i.
**[15:57]** And then off course you have x i x i dot x
i dot x i dot equal to x i multiplied by...
**[16:20]** Delta, which f...
**[16:36]** This you have to be little careful about,
I mean there are too many repeated indices,
**[16:43]** the index notation says, that if you have
an index i on the left hand side, it should
**[16:47]** appear on the right hand side, as well if
you have index j on the left, j should appear
**[16:51]** on the right as well. Every free index which
appears on the left must appear every time
**[16:56]** on the right as well, and every repeated index
is summed over, so the notation is very simple
**[17:02]** and self correcting. Free indices will appear
only ones on either side of the equation,
**[17:07]** a repeated index will appear twice and it
is a dummy index it summed over; if it appears
**[17:14]** thrice you made a mistake, as simple as that.
So, this does not look very good to me, so
**[17:20]** what should I do?
Well, look at the following you have x 1 dot
**[17:27]** is approximately equal to x.
**[17:30]** We put everything at the origin, so it is
equal to x 1 delta f 1 over delta x 1 plus
**[17:37]** x 2 delta f 1 over delta x 2 plus etcetera
is it not, the equation for x 1 dot involves
**[17:45]** only f 1 on the right hand side. I am Taylor
expanding that function about the origin therefore,
**[17:53]** you have first order terms in x 1, x 2, x
3 etcetera, so this gives you a hint what
**[17:59]** should I write here?
Write this as x j, x j this is fine.
**[18:07]** So, you have a free index f on the left, i
on the left and 1 on the right, so its fine
**[18:12]** each has vector, and then index j summed over;
in vector notation how would I write this,
**[18:21]** x dot approximately equal to what?
**[18:30]** x dot del, x j 1.
x dot del.
**[18:37]** x dot del yes.
Operating on f, you agree this yes, this is
**[18:54]** a scalar operator acts on a vector produces
a vector, and this is a vector on the left
**[18:59]** hand side, so is this fine good, so you write
it on the bottom of notation you like write
**[19:10]** the equations out if you like, but its fine
either way, plus higher order terms, which
**[19:15]** require more indecision to write down and
so on. But, now let us make an assumption
**[19:20]** that the critical point where involved with
is a simple critical point, by that I mean
**[19:26]** that this matrix, this set of number evaluated
at the origin, by the way all these things
**[19:33]** are to be evaluated at x equal to 0, because
you want everything at the critical point.
**[19:40]** So, this matrix this is a matrix, because
it got two indices now, that Jacobean matrix
**[19:49]** you should assume is not singular; that a
singular, then you have higher order critical
**[19:57]** point and things becomes more complicated.
So, the initial assumption is that this Jacobean
**[20:03]** matrix is not very singular, what then do
the actual equations looks like at this point.
**[20:13]** Let us write it to the two by two cases, the
two-dimensional case, then you see the generalization
**[20:17]** to the N dimensional cases obvious. So, in
the two-dimensional case, let me just write
**[20:22]** x dot equal to f of x, y and y dot is equal
to g of x, y, just so that we have two different
**[20:30]** functions, instead of f 1 and f 2 I call them
f and g, and set of x 1 and x 2 I just call
**[20:36]** it as x and y, and look at what happens. Then
this is N equal to 2 critical point 
given by f of x, y equal to 0 g of x, y equal
**[20:59]** to 0; that is, where the vector field vanishes.
Now, typically f of x, y is equal to 0 is
**[21:06]** a curve in the x, y plane and so is g equal
to 0 and generically two curves in the plane
**[21:13]** would intersect at isolated point; and those
points are your critical points. Then take
**[21:20]** any one of those critical points, let us call
it the origin, this critical point is origin
**[21:26]** and we would like to see what the system does
near the origin, and the statement is I write
**[21:31]** near the origin x dot equal to f of 0, 0.
But that 0 by definition, because it is a
**[21:38]** critical point plus x times delta f over delta
x at the origin, let me just denoted by 0
**[21:49]** plus y times delta x over delta y at 0 plus
higher order terms proportional to x square
**[21:58]** x, y and y squared and then the cubic terms
and so on. And similarly y dot is f of 0,
**[22:07]** 0 that 0 by definition plus x delta g over
delta x as origin plus y delta g over delta
**[22:17]** y origin plus higher order terms plus higher
order terms.
**[22:27]** So, what have be succeeded in making a system
look like, it is evident now immediately that
**[22:34]** in the close vicinity of the origin, this
system is looks like x y d over d t equal
**[22:44]** to a b c d x y, where a b c d are these four
partial derivatives evaluated at the origin.
**[22:59]** And their numbers, and the assumption this
is not a singular matrix; what has happened,
**[23:08]** then what sort of system has this become a
linear system, it is become a linear system.
**[23:15]** So, vicinity immediate vicinity of a simple
critical point, this system has been linearised.
**[23:21]** And now, we know how to solve linear equations,
because we know that the solution with as
**[23:26]** exponential an exponential in time, and this
is our trick, this is going to be our basic
**[23:32]** trick; so this linear matrix L this is nothing
but, the Jacobean f, g over delta x, y evaluated
**[23:45]** at the origin, this is a short hand notation
for this set of partial derivatives, all evaluated
**[23:53]** at that point. And you put them in a matrix
and then the equation looks like, d over d
**[23:59]** t f preposition of the represented point in
phase space; it is position in phase space
**[24:06]** is a matrix, constant matrix multiplied by
the vector itself, so the system has been
**[24:15]** linearised.
It will become intrinsically non linear exactly,
**[24:25]** if its singular well, we will come to this
if these partial derivatives vanish for example
**[24:30]** two cases, one is all the partial derivatives
vanish, in which case it is become a non linear
**[24:35]** system. The other possibility is does not
vanish, but the determinant of this matrix
**[24:42]** is 0, then of course you have situation which
is singular and we will see what happens,
**[24:47]** when it is singular. We will see that it is
become degenerate in certain case in a certain
**[24:52]** sense; we will look at that case in some detail.
**[24:56]** But generically typically you are all expert
that behavior you expert these function f
**[25:01]** and g, would have first derivatives typically
at every point and therefore, if the slope
**[25:06]** is define slopes are defined at that point,
you have matrix L. And you have to deal with
**[25:11]** this linear problem, which is of course well
know to us, and what is that solution look
**[25:16]** like, we know that x when equal to e to the
L t times x at 0, this is x at time t, sufficiently
**[25:33]** close to this point. Therefore, immediate
vicinity of this critical point, the trajectory
**[25:41]** would behave its time dependents will be given
by this exponential here; not at the critical
**[25:48]** point at the critical point, if you start
with an initial condition at the critical
**[25:51]** point you remain there, because that is an
equilibrium point.
**[25:55]** But, in its neighborhood if this therefore,
is your critical point in its neighborhood,
**[26:01]** wherever you start where you are in move out,
and move in will depend on into the point
**[26:06]** L t, and an what property is this L would
this depend, on the Eigen values; if the Eigen
**[26:14]** values have positive real parts, you would
have behavior with grows with time.
**[26:19]** If they have negative real parts things were
fall in to this, and if they had 0 real parts
**[26:24]** you expect that, what would you expect?
Pure, you would expect oscillatory behavior,
**[26:32]** you would expect things would go around, this
was the lesson we learnt from the harmonic
**[26:35]** oscillator; and this is exactly what we want
to codifying, so everything is going to be
**[26:40]** depend on the set of Eigen values of this
matrix here. Now, there are two ways of doing
**[26:44]** this one them is to just write down the general
case, and the other thing is to do the two-dimensional
**[26:49]** case in a little more detail, that prepare
to do in two d case in more details, because
**[26:54]** you can see geometrically what is going to
happen.
**[26:57]** So, for some time from now, let us continue
focus on the two-dimensional case, and just
**[27:02]** I will continuous with this notation instead
of x 1 to x 1 and x 2, I just use x and y
**[27:08]** let us continue this notation. Now what happens
next, everything would depend on e to the
**[27:14]** power of L t, and I told you that the simple
ways of finding out what e to the power L
**[27:23]** t is, by the way you do not need to again
I emphasize, you do not need to be able to
**[27:29]** diagonaliz L, all you need its immediate Eigen
or its Eigen values, that value easy to find.
**[27:36]** And do you know how to exponentiation this
matrix, how to explicitly find e to the power
**[27:45]** L t, for an arbitrary two by two matrix this
happens to be possible, not so for an arbitrary
**[27:53]** three by three or four by four or n by n matrix.
But in the case of two-dimensional matrix,
**[27:59]** just two-dimensional matrix arbitrary two
by two matrices, this turns out to be felt
**[28:04]** easy and simple to do, and let me spend a
few minutes and do this, I will look at some
**[28:12]** examples, and then you get some practice.
**[28:15]** You see the difficulty is that if you took
a matrix L a b c d and you want to find a
**[28:24]** L square L cube and so on, this can be extremely
tedious and the reason it becomes tedious
**[28:28]** is because, this is short hand for a times
1 0 0 1 plus b times 0 1 0 0 plus c times
**[28:36]** 0 0 1 0 plus d times 0 0 0 1, this thing is
hear is short time for that, and these are
**[28:49]** the four basis matrices the natural basis
by two by two matrices. In the language of
**[28:58]** linear algebra that is the natural basis,
and this is what you mean by matrix however,
**[29:06]** the problem arises sorry this should be a
0 here.
**[29:10]** The problem arises, because these matrices
there commutation properties are not a trivial,
**[29:16]** so if you take two of these matrices and ask
what is the product and what is the product
**[29:21]** in reverse order, then not necessarily equal
to each other, and you can see that this gets
**[29:25]** fairly complicated as you go along. So, what
one would like to do is to change the basis
**[29:30]** to a better basis, where the mutual commutation
properties between the basis vectors, basis
**[29:36]** matrices is little simpler, and these are
the famous Pauli matrices.
**[29:40]** So, you have of course a unit matrix which
is 1 0 0 1, you have first matrix sigma 1
**[29:48]** equal to 0 1 1 0, sigma 2 equal to 0 minus
i i 0, sigma 3 equal to 1 0 0 minus 1, these
**[30:03]** are call the Pauli matrices. Are you familiar
with the matrices, yes some of you are, some
**[30:09]** of you are not never mind it is actually quite
simple, these matrices have a very interesting
**[30:16]** properties, they call the Pauli matrices.
And they are linearly independent of each
**[30:28]** other and its elementary statement to say
that any arbitrary two by two matrixes can
**[30:34]** be expanded uniquely as a linear combination,
not of just these four basis say matrices,
**[30:42]** but of these four basis matrices. So, you
could write any arbitrary two by two matrix
**[30:49]** as a linear combination of I sigma 1, sigma
2 and sigma 3, that is a simple exercise,
**[30:56]** I leave it you do that, because start with
this a b c d; and insist on writing it in
**[31:03]** this form.
So, write this thing as the same matrix, write
**[31:07]** it as alpha naught I plus alpha 1 sigma 1
plus alpha 2 sigma 2 plus alpha 3 sigma 3,
**[31:19]** and you see immediately that alpha naught,
alpha 1, alpha 2, alpha 3 are linear combinations
**[31:27]** of a b c d; and you can solve for terms of
other and voice verse unique, so this immediately
**[31:35]** shows that you could expand a matrix in this
basis as well. There is no restriction that
**[31:40]** they alpha has to be real or anything like
that, because as you have see on of the basis
**[31:43]** matrices itself has got I.
The advantage of this basis is that these
**[31:51]** matrices are hermeation, they are equal to
the complex transposes, that is not true here,
**[32:01]** on the other hand these matrices have that
symmetric property. And it is also a simple
**[32:05]** exercise to show, I am going to gives this
is a problem set look at all, work out all
**[32:09]** the properties of these.
**[32:12]** Sigma is square equal to the unique matrix,
the square of the everyone of these matrices
**[32:17]** is equal to the identity matrix; moreover
sigma i sigma j plus sigma j sigma i equal
**[32:28]** to 0 if i naught equal to j, the anti commute
with each other, that is very, very powerful
**[32:41]** property for what we want to do. Because,
if you want write e to the power L t, you
**[32:47]** write e to the L t equal to e to the alpha
naught I plus, let me call it alpha i sigma
**[32:55]** i with the summation over the index i implied,
looks almost like a vector alpha dot sigma,
**[33:04]** except you must remember that the components
of alpha, alpha 1, 2, 3 need not be real numbers,
**[33:09]** could be complex number in general.
And we have task of finding this quantity
**[33:14]** here, what is this equal to well, you know
e to the power a plus b is not equal to e
**[33:20]** to the a times e to the b in general where
a and b are matrices. And the reason is e
**[33:26]** to the power a would have only powers of a,
and e to the b would have only powers of b,
**[33:32]** so if I write e to the power a multiplied
by e to the power b, all the a's are on
**[33:36]** the left and all the b's are on the right,
that is not true when I have a plus b in the
**[33:41]** numerator.
So, you can see that e to the A e to the B
**[33:45]** is I plus A plus etcetera i plus B plus etcetera
and if i work this out and write it out all
**[33:54]** the A stay on the left and all B stay on the
right; but, if took e to the A plus B equal
**[34:01]** to i plus A plus B plus 1 over 2 factorial,
and what is the next term, what is the quadratic
**[34:12]** term, its A square plus A B plus B A plus
B square. So, you see there are terms which
**[34:22]** have B on the left and A on the right, and
as you go to higher powers more and more of
**[34:26]** this will happen, that be combination like
B A B, A B A and so on, that is not allowed
**[34:32]** for here.
So, this is not equal to this quantity is
**[34:38]** not equal that for matrices or for operators
etcetera. On the other hand, if I look at
**[34:47]** this quantity here, and this alpha 1 sigma
1 plus alpha 2 sigma 2 plus alpha 3 sigma
**[34:56]** 3, and I expand it out this quantity commutes
with everything, so you can actual move it
**[35:02]** out. You can write this as e to the alpha
naught I multiplied by this thing here, but
**[35:07]** when you expend the exponential here, you
get terms like sigma 1 squared which is a
**[35:12]** identity, sigma 2 squared the identity, sigma
3 square is the identity; when you get combinations
**[35:17]** like alpha 1 alpha 2, sigma 1 sigma 2 plus
sigma 2 sigma 1 that 0, because of this anti
**[35:25]** commutation property.
Therefore, you can actually find the exponential,
**[35:30]** when you take any two of these in opposite
orders and taken the output valences, completely
**[35:35]** valences, so I leave the rest of basis exercise
to you, actually work out what e to the power
**[35:41]** alpha, alpha naught I plus these guess then
write a very compact formula for it in terms
**[35:48]** of the alphas completely. What would you expect,
what would you expect is the final answer
**[35:56]** after go through the entire, what would expect
nothing very complicated, because this is
**[36:07]** also two by two matrix, and we just said that
every two by two matrix could be uniquely
**[36:12]** expanded in terms of the identity matrix,
and the Pauli matrices.
**[36:17]** So, the final answer has to be something of
the form, some beta naught I plus beta 1 sigma
**[36:25]** 1, it has to be of that form, and there is
no option nothing but, that all that happens
**[36:40]** is the beta's are complicated functions
of the alphas, in this case not very complicated.
**[36:44]** So, I leave you to work this out, and that
will tell you how to exponentiate such a matrix,
**[36:51]** is a very simple formula which once you remember,
the formula or work it out you can apply in
**[36:56]** every given case and this is the answer. Our
interest however is not in finding the expressed
**[37:02]** solution, but in finding the nature of this
solution, we like to find of what us to do,
**[37:07]** what kind of behavior you have in the neighborhood
of the critical point, at the origin this
**[37:11]** is our target.
**[37:13]** Let us start classifying it, let us start
finding out what we should have, and what
**[37:19]** the possibilities are, let me call this classification,
so I classify all the possible critical points
**[37:48]** in two-dimensions, in the x y plane. The first
possibility is that lambda 1, lambda 2 are
**[38:01]** greater than 0, two real Eigen values both
positive; let us list all the possibilities
**[38:09]** and then look at the pictures to see what
happens. The second possibility is lambda
**[38:15]** 1, lambda 2 less than 0 incidentally, the
situation where the Eigen values become equal
**[38:21]** to each other, and both positive or both negative
is a special case that is we can something
**[38:25]** you can under quite easily. The third possibility
is one of them positive, and the other negative
**[38:34]** this is possible two.
The fourth remember, you assume the matrix
**[38:43]** is not singular, so we do not allow for a
0 Eigen value at the moment, what is the next
**[38:51]** possibility they become complex, these things
become complex; so certainly you would have
**[38:57]** lambda 1, 2 equal to lambda plus or minus
i mu, where lambda and mu are real numbers
**[39:06]** and lambda is greater than 0 the real part
is positive that would mean an exploding exponential.
**[39:15]** The next one is lambda 1, 2 equal to lambda
plus minus i mu and lambda is negative, there
**[39:24]** is one more possibility.
Lambda equal to 0 pure imaginary, but not
**[39:33]** 0 pure imaginary Eigen values, so the last
of this lambda 1, 2 plus or minus and that
**[39:45]** is it, this exhausts everything. Now, we have
to do it is look at each of the cases find
**[39:54]** out, what kind of critical point it is and
you have various types of critical points,
**[39:59]** and them succeeded in classifying all those
critical points two-dimension flows, where
**[40:04]** you do not have higher order critical point,
or you do not have d generate map. Let us
**[40:12]** see what happens, a simple way to do this
simply to look at an example, draw the picture
**[40:19]** and then argue that the general case is the
distortion of this picture, so let us do that.
**[40:23]** Let us look case one, which is two Eigen values
positive and I look at example always, so
**[40:29]** let us look x dot equal to its got to be linear
function of x, and the function has to vanish
**[40:34]** x is 0 and y is 0, because we are looking
neighborhood of a critical point which we
**[40:39]** assume is that the origin. So, let us look
at this that is certainly satisfies criterion,
**[40:51]** because in this case lambda 1 is equal to
lambda 2 is equal to 1 both are positive,
**[40:55]** is do not want that kind of generously, so
let us make this 2 y, what do the flow lines
**[41:05]** look like.
Let us try to draw the picture directly, so
**[41:09]** here is the x plus x axis, y axis and I like
and this is the origin that is the critical
**[41:15]** point, and remember magnified this figures,
so that I might very close to the critical
**[41:20]** point, I have just blown up this figure to
see what the trajectory looks like and what
**[41:24]** would they look like, well good ideas always
to start with special trajectories and then
**[41:29]** look at the more general case. So, suppose
I start with an initial condition here very
**[41:34]** close, y is 0 and therefore, never takes of
this guy does not take off, and x x dot x
**[41:44]** and say x is increasing, because x is positive.
And which direction is flow going to be, it
**[41:51]** is going to be outwards, that is the trajectory
by itself, so wherever you are on this point
**[41:57]** on this line it's going to move out words
along that. So, you really do not care, it
**[42:02]** is hole family of initial conditions, you
have taken care of had you started on this
**[42:06]** side then of course, it would move in the
negative direction, remember we are not interested
**[42:12]** in how you are moving as function of time
this says x goes like e to the t times x naught,
**[42:19]** so what about the x naught is just multiplied
e to the power t and moves off. If you start
**[42:25]** with y then of course, you go there, and you
go there we start now, away from the axis
**[42:32]** so we taken care of four axis, to start with
an initial condition let us see here, what
**[42:38]** would it do well, it would tend to increase
x, and tend to increase y but, remember x
**[42:46]** goes like e to the power t times x of 0 and
y goes like e to the power 2 t times y of
**[42:54]** is 0.
And you could in fact eliminate t between
**[42:58]** these two, and you discovery y is propositional
to x square, so from here what would you do,
**[43:06]** you move in a parabolic path, so really get
off like this, in this passion and if you
**[43:14]** start at here move of like this, you start
at here do this, if you start of here you
**[43:22]** do this. Except if you start on the axis you
always going to be one of these curves, remember
**[43:30]** the actual flow once move sufficiently far
away from the critical point, you would have
**[43:34]** to include non linear terms higher terms and
then it would change, but in the infinite
**[43:38]** as mean finite of the critical point this
is what a flow looks like.
**[43:43]** And wherever you are, it would do the same,
except for this point, so the entire neighborhood
**[43:57]** has this set of trajectories moving out and
these two, so it is as if where you have,
**[44:08]** you are you a common tangent the x axis, and
there is one exceptional direction the y axis.
**[44:16]** Yes, but I could start with x naught here,
that would also lie on its own trajectory,
**[44:24]** so whatever initial condition I start on,
I am part of a parabola, so I have a family
**[44:30]** of parabola some pointing up, some pointing
down in this passion. So, this is what the
**[44:38]** picture looks like, what would call this stable
point or an unstable point, unstable because,
**[44:43]** every direction is bring thrown out therefore,
we should really properly put a cross here,
**[44:48]** and immediately call this unstable; it is
called an unstable node, the different terms
**[44:58]** for this but, I will use one set of terms
once for all it is an unstable node.
**[45:06]** Case two its trivial to solve, incidentally
the case when the two node when the two Eigen
**[45:13]** values are equal, what would happen then,
it was still be an unstable node but, what
**[45:20]** would happen if you did not have this two
is that both of them would go like e to the
**[45:24]** t, in the ratio would there would be a constant
which would mean, that the ratio that these
**[45:28]** are the straight lines.
So, the picture would really look like this,
**[45:32]** with get a kind of star pattern this would
is what would happen it lambda 1 equal to
**[45:46]** lambda 2 right then see, that two is an unstable
node. The difference between these two pictures
**[45:57]** is that here, there is a common tangent with
one exceptional trajectory direction, but
**[46:02]** it has no such thing, every direction is allowed.
So, this radially outward pattern immediately
**[46:10]** tells you that it is an unstable node, so
does this what would happen, if both these
**[46:17]** things where negative.
Case 2 all I have to do put minus signs, what
**[46:27]** would happen to this picture all the arrows
will be reversed, everything would flow in
**[46:33]** as asymptotically would you call this stable
or unstable?
**[46:36]** I call it as asymptotically stable, because
I am going to distinguish between stability
**[46:41]** and as asymptotically stability and that different
property all together. So, things would flow
**[46:47]** in be as asymptotically stable, so all arrows
reversed everything reversed etcetera, you
**[46:52]** would not bother to rest of it, and this is
an as asymptotically stable is asymptotically
**[47:05]** stable node.
**[47:09]** Let us go to case 3 which is interesting so
case 3, the simplest very do the x dot is
**[47:20]** x and y dot is minus y a, let us put it as
minus 2 y with 2 Eigen values a 1 and minus
**[47:28]** 2, in this case and things are flowing in
the y direction that exploding in the x direction.
**[47:34]** And what would the picture look like, once
again if I start at y equal to 0, then x just
**[47:44]** increases the time so this is suddenly a trajectory
and so is this a trajectory, the moment you
**[47:50]** have things going out it means it unstable,
so let us just put across there right away
**[47:56]** moment you have things slowing in some direction
or the other, it means system is really unstable
**[48:00]** the across. And in y things come in and sort
by start with it x exactly equal to 0 to start
**[48:09]** with in initial condition that of course things
broken. But, if I do not do that and I start
**[48:15]** here what would happen?
**[48:19]** Yes exactly, so the whole plain is tried by
these, curves its look like hyperbolas, but
**[48:32]** of course they are not hyperbolas, the reason
they not hyperbolas is because, x increases
**[48:38]** like e to the t, but y increases like e to
the decreases like e to the minus 2 t, so
**[48:45]** you do not have x y equal to constant.
x squared y equal to constant, it does not
**[48:51]** matter it still got a shape which looks roughly
like this may not hyperbolas, but its call
**[48:55]** it hyperbolic point or a saddle point; so
this is a saddle point, unstable saddle point.
**[49:24]** Next case 4, lambdas positive on this case,
what would it look like, this is a little
**[49:30]** trickier here little harder to do we could
write on example which would do this, but
**[49:38]** we can argue this out even by without writing
down a very simple example.
**[49:41]** But mind you have to object at this stage
on say well, how do we know this is true even
**[49:47]** if you had more complicated flows, I assumed
extremely simple flows, I said x dot is x,
**[49:52]** y dot is y or minus y. So, I decoupled x and
y and the question to be asked is, if you
**[49:57]** couple x and y, if you have general linear
terms, which involve both x and y how do we
**[50:02]** now, this is still true I have to still convince
you that this is exactly, what is going to
**[50:06]** happen will come that in a minute.
But let us finish the classification, when
**[50:10]** we go back and tell you what happens in the
general case, what would happen there is that
**[50:16]** both x and y, would have terms like e to the
power lambda t, e to the power i mu t plus
**[50:23]** or minus both x and y would have linear combinations
of this. This quantity here is simply sign
**[50:30]** cosines, and signs it just osculate but, e
to the lambda t when lambda is positive is
**[50:37]** explodes out words, so you really have osculated
behavior such that, the sign of x and y would
**[50:42]** change between positive and negative. But,
the magnitude would increase in this case,
**[50:46]** so to be an unstable spiral.
So, in this case it is clear, that the picture
**[50:55]** is going to look like, its going to outward
which direction it moves an etcetera as a
**[51:01]** matter of detail, but it something which gets
out. Therefore it is not too hard to see that
**[51:08]** this is an unstable, spiral point; there are
other names given to this one of them is focus
**[51:22]** sometimes its called dot x whatever but, you
just call it an unstable spiral point.
**[51:33]** Yes, that is a good point, if mu goes to 0
this fellow this should tend to the case of
**[51:42]** the unstable node, we will see explicitly
how this happens, will see distortion would
**[51:48]** occur an here, and we will see what happens.
You can see that immediately, in in some sense,
**[51:55]** if mu goes to 0, the time of this period of
this oscillation, the frequency of the oscillation
**[52:00]** is mu, so the time period of the oscillation
is infinite. So, you can see that it never
**[52:05]** complete a spiral, it will just move out or
move in immediately; but, we will see this
**[52:11]** explicit.
What would I call this, it would just be an
**[52:19]** asymptotically spiral point things would flow
in, this is what happened in the case of the
**[52:24]** damp simple harmonic oscillator, so this is
this as asymptotically stable spiral point.
**[52:38]** And finally the case of pure imaginary Eigen
values, we have already studied one case
**[52:46]** The simple harmonic oscillator the and damped
oscillator, what was that critical point they
**[52:51]** were ellipsis, they will like ellipses, but
it was a centre, this point is called the
**[52:58]** centre. So, let us write the oscillator case
once again down is x dot equal to v, v dot
**[53:09]** equal to minus omega squared x, so in this
case L the matrix was 0 1 minus omega squared
**[53:16]** 0 and lambda 1, 2 is equal to what, what are
the Eigen values of this matrices?
**[53:28]** Plus or minus I omega, that is why the solutions
like cos omega t, and sin mega t this is you
**[53:39]** know that right nil, went in nor went out
because, there is now exponential fact to
**[53:44]** pre multiplying the cosine or sine, and this
was the centre, would you call its stable
**[53:55]** or unstable?
It is certainly not unstable, but it is not
**[54:04]** as asymptotically stable either, it does not
follow into this point I call stable, that
**[54:11]** will tell us how to distinguish between stability,
and asymptotic stability; notice this is the
**[54:19]** only place where I have used the words stable
everywhere else its either unstable or asymptotically
**[54:24]** stable, that point is just stable.
And what was peculiar about this problem,
**[54:33]** which is not there everywhere else
Periodic
**[54:38]** Periodic periodic this corresponded to periodic
motion a moment you have a centre you has
**[54:42]** periodic motion, none of these motions is
periodic, they either damp periodic motions
**[54:49]** or there motions without any such periodicity,
but this is the only one which is periodic.
**[54:56]** And it is delicately balanced its periodic,
because the linearise matrices around the
**[55:00]** critical point has exactly 0, real part and
you see how accidental result.
**[55:05]** So, we will see the periodic motion is quite
exception, things are be just right a little
**[55:14]** bit friction here and its gone completely,
a little bit positive feedback and it explodes
**[55:19]** give the direction. So, maintaining periodicity
is not so easy, really very delicately poised
**[55:26]** and we will see it is going to give us lot
of headaches periodic, then the general case.
**[55:30]** Now, let us come back and answer this question
of why did not I look at the general case,
**[55:35]** why did I do this, my answer is following.
My answer is that the Eigen values they determine,
**[55:46]** whether thing is stable or unstable or asymptotically
stable; and these Eigen values are independent
**[55:53]** of linear transformations that I make on these
matrices. If I took a matrices, and then a
**[55:59]** similarity transformation on it then the Eigen
values do not change, that is easy to see
**[56:06]** because, what are the Eigen values of L, L
is a b c d, and then secular equation is lambda
**[56:15]** minus a lambda minus d minus b minus c 0 equal
to this, equal to lambda square minus lambda
**[56:28]** times (a plus d) plus a d minus b c equal
to 0.
**[56:38]** And the Eigen values therefore, lambda 1,
2 equal to a plus d plus or minus the square
**[56:44]** root of a plus d the whole square minus 4
times a d minus b c over 2, but do these combinations
**[56:57]** remind you of anything, what is a plus d?
It is the trace of the matrices, it is the
**[57:05]** sum of the diagonal elements, its call the
trace of the matrices, so I have trace equal
**[57:12]** to T equal to a plus d and what is a d minus
b c, its determinant, the determinant L equal
**[57:22]** to D. The Eigen values can therefore be written,
as equal to T plus or minus square root of
**[57:34]** T square minus 4 D, this tells you that the
Eigen values of two by two of the matrices,
**[57:44]** do not really depend on all the elements in
some independent fashion but only on two combinations;
**[57:50]** the trace and the determinant.
And both these are independent are in variant,
**[57:54]** when you make a similarity transformation,
so what will do is to start at this point
**[58:03]** and explode these invariance to argue, that
we do not have to study the case in generality
**[58:08]** in each case, explicitly what we have here
based on our simple example suffices; this
**[58:14]** already tells us this is the general case,
and I exploit this in variance here to talk
**[58:21]** about this by the way this should be 2 of
3 by 3 or 4 by 4, so I leave it as home work
**[58:28]** exercise for you.
Next time will talk about it what happens
**[58:31]** in the three-dimensional case, what would
the Eigen values depend on, they should also
**[58:36]** depend on combinations, it would not change
when you make similarity transformation on
**[58:40]** the matrices; you have trace is one of them,
determinant one of them but you need a third.
**[58:44]** Because, there are three Eigen values in that
case in the N dimension case, you need N of
**[58:48]** them, so think about this and you came back
because, it has some significance, we will
**[59:10]** stop here.