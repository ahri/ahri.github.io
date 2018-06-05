<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ideas for Haskell Group</title>
  <link rel="stylesheet" href="https://stackedit.io/style.css" />
</head>

<body class="stackedit">
  <div class="stackedit__left">
    <div class="stackedit__toc">
      
<ul>
<li>
<ul>
<li><a href="#group-project">Group project</a></li>
<li><a href="#lenses">Lenses</a></li>
<li><a href="#recursion-schemes">Recursion schemes</a></li>
<li><a href="#frp">FRP</a></li>
<li><a href="#pipesstreaming">Pipes/Streaming</a></li>
<li><a href="#tagless-final-style">Tagless final style</a></li>
<li><a href="#monoids">Monoids</a></li>
<li><a href="#functors">Functors</a></li>
<li><a href="#monads">Monads</a></li>
<li><a href="#arrows">Arrows</a></li>
<li><a href="#the-record-problem">The record problem</a></li>
<li><a href="#papers">Papers</a></li>
</ul>
</li>
</ul>

    </div>
  </div>
  <div class="stackedit__right">
    <div class="stackedit__html">
      <h2 id="group-project">Group project</h2>
<ul>
<li>bombastic-hs only has basic logic, plenty of work to do
<ul>
<li>refactoring since I wrote it before I knew any typeclasses</li>
<li>UI
<ul>
<li>CLI</li>
<li>Web</li>
</ul>
</li>
<li>AI</li>
<li>Networking (client/server [WebSockets], p2p [WebRTC])</li>
</ul>
</li>
</ul>
<h2 id="lenses">Lenses</h2>
<ul>
<li><a href="https://artyom.me/lens-over-tea-1">lense over tea</a></li>
<li><a href="https://mmhaskell.com/blog/2017/6/12/taking-a-close-look-at-lenses">close look blog</a></li>
<li><a href="http://www.haskellforall.com/2013/05/program-imperatively-using-haskell.html">game example - program imperatively</a></li>
</ul>
<h2 id="recursion-schemes">Recursion schemes</h2>
<ul>
<li><a href="http://blog.sumtypeofway.com/an-introduction-to-recursion-schemes/">blog intro series</a></li>
</ul>
<h2 id="frp">FRP</h2>
<ul>
<li><a href="http://hexagoxel.de/postsforpublish/posts/2017-10-30-brick-plus-reflex.html">reflex with brick</a> to avoid ghcjs</li>
</ul>
<h2 id="pipesstreaming">Pipes/Streaming</h2>
<ul>
<li><a href="https://www.reddit.com/r/haskell/comments/5x2g0r/streaming_package_vs_pipes_conduit_question_on/">discussion</a></li>
</ul>
<h2 id="tagless-final-style">Tagless final style</h2>
<ul>
<li><a href="http://okmij.org/ftp/tagless-final/">http://okmij.org/ftp/tagless-final/</a></li>
</ul>
<h2 id="monoids">Monoids</h2>
<ul>
<li><a href="http://eed3si9n.com/herding-cats/Free-monoids.html">http://eed3si9n.com/herding-cats/Free-monoids.html</a></li>
<li><a href="https://bartoszmilewski.com/2017/02/09/monoids-on-steroids/">Looong detailed post</a></li>
<li><a href="https://bartoszmilewski.com/2018/02/17/free-monoidal-functors/">Free Monoidal Functors</a></li>
<li><a href="http://tech.frontrowed.com/2017/09/22/aggregations/">Beautiful Aggregations</a></li>
</ul>
<h2 id="functors">Functors</h2>
<ul>
<li><a href="http://hao.codes/functors.html">co, contra &amp; pro</a></li>
<li><a href="https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/profunctors">profunctors</a></li>
<li><a href="https://ocharles.org.uk/blog/guest-posts/2013-12-21-24-days-of-hackage-contravariant.html">24 days contravariant</a></li>
<li><a href="https://ocharles.org.uk/blog/guest-posts/2013-12-22-24-days-of-hackage-profunctors.html">24 days profunctor</a></li>
</ul>
<h2 id="monads">Monads</h2>
<ul>
<li>
<p>free</p>
<ul>
<li><a href="https://blog.functorial.com/posts/2012-07-22-What-Makes-The-Free-Monad-Free.html">What makes the free monad free?</a></li>
<li><a href="http://eed3si9n.com/herding-cats/Free-monads.html">http://eed3si9n.com/herding-cats/Free-monads.html</a></li>
<li><a href="https://www.tweag.io/posts/2018-02-05-free-monads.html">cheap interpreters</a></li>
<li><a href="https://medium.com/@olxc/free-monads-explained-pt-1-a5c45fbdac30">https://medium.com/@olxc/free-monads-explained-pt-1-a5c45fbdac30</a></li>
<li><a href="https://markkarpov.com/post/free-monad-considered-harmful.html">Considered Harmful</a></li>
</ul>
</li>
<li>
<p>co</p>
<ul>
<li><a href="https://blog.functorial.com/posts/2016-08-07-Comonads-As-Spaces.html">https://blog.functorial.com/posts/2016-08-07-Comonads-As-Spaces.html</a></li>
<li><a href="https://functorial.com/the-future-is-comonadic/main.pdf">Declarative UIs</a> (very short paper)</li>
<li>cofree</li>
</ul>
</li>
<li>
<p><a href="http://dlaing.org/cofun/posts/free_and_cofree.html">free &amp; cofree</a> - Free for DSLs, cofree for interpreters</p>
</li>
</ul>
<h2 id="arrows">Arrows</h2>
<ul>
<li>some scepticism about their use</li>
<li>lots of overlap with monads &amp; applicatives</li>
<li><a href="https://ocharles.org.uk/blog/guest-posts/2014-12-21-arrows.html">arrow extension</a></li>
<li><a href="https://en.wikibooks.org/wiki/Haskell/Understanding_arrows">Understanding</a> looks thorough &amp; has diagrams</li>
</ul>
<h2 id="the-record-problem">The record problem</h2>
<h2 id="papers">Papers</h2>

    </div>
  </div>
</body>

</html>
