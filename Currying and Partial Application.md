<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Currying and Partial Application</title>
  <link rel="stylesheet" href="https://stackedit.io/style.css" />
</head>

<body class="stackedit">
  <div class="stackedit__html"><h1 id="currying-and-partial-application">Currying and Partial Application</h1>
<blockquote>
<p>last updated: 2018-11-11</p>
</blockquote>
<h2 id="for-non-programmers">For non-programmers</h2>
<p>“Currying” and “partial application” are just a couple of many terms that you’ll need to get used to; it’s best to face up to this now: computer science and mathematics hold many concepts that don’t directly relate to the real world, so while we might be able to provide analogies using real world examples, the concepts themselves don’t have a normal name we can easily use so we end up with new names - which makes more sense than re-using inappropriate names; that would get confusing. So brace yourself for that, write the weird names down, and write down what they mean to you - expecting to alter them as you go and realise that you may have been subtly wrong (I speak from experience!)</p>
<p>So on with the definitions:</p>
<p><strong>Currying</strong> is a term that means being able to deal with inputs one at a time, in batches, or all at once - this probably seems natural to you if you’re not a programmer, but in most programming languages it’s all-or-nothing! If you want to make a curry you need to have all the ingredients ready right now or you absolutely refuse to make it at all. Maybe this is why programmers get confused about the real world. <em>Actually the name is unrelated to curry-the-food and is actually named after <a href="https://en.wikipedia.org/wiki/Haskell_Curry">Curry</a>-the-mathematician whose first name was Haskell :)</em></p>
<p><strong>Partial application</strong>, then, is a term used to describe only having a few ingredients right now - you probably have (1) onions, potatoes, cinnamon and maybe some garlic, but aiming to complete the process some time; maybe after nipping to the shops to buy (2) cumin and ghee, realising that Tesco doesn’t sell the latter, and hopping on a bus to your local south-Asian supermarket (3) to pick some up before getting home to do the actual cooking. At each numbered point you partially-applied ingredients.</p>
<p>There are many ways in which this analogy breaks down, so you’ll just have to suspend disbelief and go with it!</p>
<p>Now we need to start using another word: “function” - it’s used in a mathematical sense where we consider it a machine into which we put things and it produces something out of the other end, if the things we put in are called “inputs” and the thing we get out is called an “output” then we say: the output is a function of its inputs.</p>
<p>In the analogy I’m saying (in mathsy terms) that curry-the-food is a function of its ingredients, and that we can keep adding these ingredients as we have them available.</p>
<p>In Haskell we’d capture the above in some notation, you shouldn’t expect to understand all the odd characters used but you can hopefully see the parallels between the paragraphs above and the code provided to capture it:</p>
<pre class=" language-haskell"><code class="prism  language-haskell"><span class="token comment">-- first we encode the recipe for curry:</span>
<span class="token hvariable">makeCurry</span> <span class="token operator">::</span> <span class="token constant">Onions</span> <span class="token operator">-&gt;</span> <span class="token constant">Potatoes</span> <span class="token operator">-&gt;</span> <span class="token constant">Cinnamon</span> <span class="token operator">-&gt;</span> <span class="token constant">Garlic</span> <span class="token operator">-&gt;</span> <span class="token constant">Cumin</span> <span class="token operator">-&gt;</span> <span class="token constant">Ghee</span> <span class="token operator">-&gt;</span> <span class="token constant">Curry</span>
<span class="token hvariable">makeCurry</span> <span class="token operator">=</span> <span class="token builtin">undefined</span> <span class="token comment">-- sorry, this is not a cookery website, so I'm skipping making the actual curry!</span>

<span class="token comment">-- as described above, step-wise</span>
<span class="token hvariable">step1</span> <span class="token operator">=</span> <span class="token hvariable">makeCurry</span> <span class="token hvariable">onions</span> <span class="token hvariable">potatoes</span> <span class="token hvariable">cinnamon</span> <span class="token hvariable">garlic</span>
<span class="token hvariable">step2</span> <span class="token operator">=</span> <span class="token hvariable">step1</span> <span class="token hvariable">cumin</span>        <span class="token comment">-- note that we're dependent upon step1</span>
<span class="token hvariable">curryMeal</span> <span class="token operator">=</span> <span class="token hvariable">step2</span> <span class="token hvariable">ghee</span>     <span class="token comment">-- and again, we're dependent upon step2</span>

<span class="token comment">-- in the style required in most languages:</span>
<span class="token hvariable">curryMealAllInOne</span> <span class="token operator">=</span> <span class="token hvariable">makeCurry</span> <span class="token hvariable">onions</span> <span class="token hvariable">potatoes</span> <span class="token hvariable">cinnamon</span> <span class="token hvariable">garlic</span> <span class="token hvariable">cumin</span> <span class="token hvariable">ghee</span>
</code></pre>
<hr>
<h2 id="for-programmers">For programmers</h2>
<h3 id="currying">Currying</h3>
<p>Currying is the process of taking a multi-parameter function and turning it into a single-parameter function.</p>
<p>Let’s take an example using JavaScript so you can follow along in your browser (hit F12, click “Console”):</p>
<pre class=" language-javascript"><code class="prism  language-javascript"><span class="token keyword">const</span> <span class="token function-variable function">add</span> <span class="token operator">=</span> <span class="token punctuation">(</span>x<span class="token punctuation">,</span> y<span class="token punctuation">)</span> <span class="token operator">=&gt;</span> x <span class="token operator">+</span> y<span class="token punctuation">;</span>
<span class="token function">add</span><span class="token punctuation">(</span><span class="token number">1</span><span class="token punctuation">,</span> <span class="token number">2</span><span class="token punctuation">)</span><span class="token punctuation">;</span> <span class="token comment">// result: 3</span>
</code></pre>
<p>To curry this function, all we need to do is add one more step to the definition, so instead of returning the result straight away, we instead take the first argument and squirrel it away for later use, giving back a new function. Let’s have a look:</p>
<pre class=" language-javascript"><code class="prism  language-javascript"><span class="token keyword">const</span> <span class="token function-variable function">add_c</span> <span class="token operator">=</span> x <span class="token operator">=&gt;</span> y <span class="token operator">=&gt;</span> x <span class="token operator">+</span> y<span class="token punctuation">;</span>
<span class="token function">add_c</span><span class="token punctuation">(</span><span class="token number">1</span><span class="token punctuation">)</span><span class="token punctuation">(</span><span class="token number">2</span><span class="token punctuation">)</span><span class="token punctuation">;</span> <span class="token comment">// result: 3</span>
</code></pre>
<p>The definition is almost the same, but we added another arrow - looks weird eh? And now calling it looks weird too, because we can only pass in one argument per function. But we get the right result so at least nothing is broken!</p>
<p>So what’s the point? Well, it allows you do nifty things like this:</p>
<pre class=" language-javascript"><code class="prism  language-javascript"><span class="token keyword">const</span> add_one <span class="token operator">=</span> <span class="token function">add_c</span><span class="token punctuation">(</span><span class="token number">1</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token function">add_one</span><span class="token punctuation">(</span><span class="token number">2</span><span class="token punctuation">)</span><span class="token punctuation">;</span> <span class="token comment">// result: 3</span>
</code></pre>
<p>Ok, maybe “nifty” is over-egging it. Think of it like the Factory pattern - in OO languages we make special abstractions to add bits of data when convenient, producing “factories” that can later be executed to produce the object we really want. This basic idea is common to the Builder concept, too.</p>
<p>Let’s consider that we want to allow a user to specify how wide the columns on their spreadsheet are, and pretend we’re outputting that spreadsheet into a fixed-width ascii field so we have to make sure that short strings get padded out.</p>
<pre class=" language-javascript"><code class="prism  language-javascript"><span class="token keyword">const</span> <span class="token function-variable function">leftpad</span> <span class="token operator">=</span> <span class="token punctuation">(</span>width<span class="token punctuation">,</span> str<span class="token punctuation">)</span> <span class="token operator">=&gt;</span> str<span class="token punctuation">.</span><span class="token function">padStart</span><span class="token punctuation">(</span>width<span class="token punctuation">)</span><span class="token punctuation">;</span>
</code></pre>
<p>So we can remember this user configuration and use our <code>leftpad</code> function when we’re outputting our spreadsheet:</p>
<pre class=" language-javascript"><code class="prism  language-javascript"><span class="token keyword">const</span> user_config <span class="token operator">=</span> <span class="token number">5</span><span class="token punctuation">;</span>
<span class="token comment">// ... many lines of code later ...</span>
<span class="token function">leftpad</span><span class="token punctuation">(</span>user_config<span class="token punctuation">,</span> <span class="token string">"foo"</span><span class="token punctuation">)</span><span class="token punctuation">;</span> <span class="token comment">// result: "  foo"</span>
</code></pre>
<p>an alternative might be to use this currying technique - note that we have two arrows in our definition this time:</p>
<pre class=" language-javascript"><code class="prism  language-javascript"><span class="token keyword">const</span> <span class="token function-variable function">leftpad</span> <span class="token operator">=</span> width <span class="token operator">=&gt;</span> str <span class="token operator">=&gt;</span> str<span class="token punctuation">.</span><span class="token function">padStart</span><span class="token punctuation">(</span>width<span class="token punctuation">)</span><span class="token punctuation">;</span>
</code></pre>
<p>which we can then preload with this user configuration:</p>
<pre class=" language-javascript"><code class="prism  language-javascript"><span class="token keyword">const</span> user_config <span class="token operator">=</span> <span class="token number">5</span><span class="token punctuation">;</span>
<span class="token keyword">const</span> configured_padder <span class="token operator">=</span> <span class="token function">leftpad</span><span class="token punctuation">(</span>user_config<span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token comment">// ... many lines of code later ...</span>
<span class="token function">configured_padder</span><span class="token punctuation">(</span><span class="token string">"foo"</span><span class="token punctuation">)</span><span class="token punctuation">;</span> <span class="token comment">// result: "  foo"</span>
</code></pre>
<p>Hopefully this illustrates both what Currying is, and also provides familiar points of reference for a JavaScript programmer. This technique can be used to substitute for constructor parameters, factories and builders.</p>
<p>Ok, now let’s compare Haskell vs. JS, where Haskell functions are automatically curried for us which is a bit neater than in JS where we manually curried our <code>add_c</code> function:</p>
<pre class=" language-haskell"><code class="prism  language-haskell"><span class="token hvariable">add</span> <span class="token operator">::</span> <span class="token constant">Int</span> <span class="token operator">-&gt;</span> <span class="token constant">Int</span> <span class="token operator">-&gt;</span> <span class="token constant">Int</span> <span class="token comment">-- given two ints, give me an int back</span>
<span class="token hvariable">add</span> <span class="token hvariable">x</span> <span class="token hvariable">y</span> <span class="token operator">=</span> <span class="token hvariable">x</span> <span class="token operator">+</span> <span class="token hvariable">y</span>

<span class="token comment">-- JS: add_c(1)(2); // result: 3</span>
<span class="token hvariable">add</span> <span class="token number">1</span> <span class="token number">2</span> <span class="token comment">-- result: 3</span>

<span class="token comment">-- JS: const add_one = add_c(1);</span>
<span class="token hvariable">add_one</span> <span class="token operator">=</span> <span class="token hvariable">add</span> <span class="token number">1</span>

<span class="token comment">-- JS: add_one(2); // result: 3</span>
<span class="token hvariable">add_one</span> <span class="token number">2</span> <span class="token comment">-- result: 3</span>
</code></pre>
<p>And whilst the Haskell type notation probably looks a bit weird right now, it has the interesting effect that you can put parentheses around the types to illustrate what the type might look like in another language, note that these parentheses are valid syntax but are not required:</p>
<pre class=" language-haskell"><code class="prism  language-haskell"><span class="token hvariable">add</span> <span class="token operator">::</span> <span class="token punctuation">(</span><span class="token constant">Int</span> <span class="token operator">-&gt;</span> <span class="token constant">Int</span><span class="token punctuation">)</span> <span class="token operator">-&gt;</span> <span class="token constant">Int</span> <span class="token comment">-- given two ints, give me an int back</span>
<span class="token hvariable">add</span> <span class="token hvariable">x</span> <span class="token hvariable">y</span> <span class="token operator">=</span> <span class="token hvariable">x</span> <span class="token operator">+</span> <span class="token hvariable">y</span>

<span class="token hvariable">add</span> <span class="token number">1</span> <span class="token number">2</span> <span class="token comment">-- result: 3</span>
</code></pre>
<h3 id="partial-application">Partial Application</h3>
<p>You’ve probably figured this out already, but this term means that a function has received some, but not all of its arguments, so it’s effectively a Factory (or a Builder, if it’s waiting for a few more arguments!) until it’s been fully applied and can return its result. The parenthesizing technique can be used to illustrate this:</p>
<pre class=" language-haskell"><code class="prism  language-haskell"><span class="token hvariable">add</span> <span class="token operator">::</span> <span class="token constant">Int</span> <span class="token operator">-&gt;</span> <span class="token punctuation">(</span><span class="token constant">Int</span> <span class="token operator">-&gt;</span> <span class="token constant">Int</span><span class="token punctuation">)</span> <span class="token comment">-- given an int, return a function</span>
<span class="token hvariable">add</span> <span class="token hvariable">x</span> <span class="token hvariable">y</span> <span class="token operator">=</span> <span class="token hvariable">x</span> <span class="token operator">+</span> <span class="token hvariable">y</span>

<span class="token hvariable">add</span> <span class="token number">1</span> <span class="token number">2</span> <span class="token comment">-- result: 3</span>
</code></pre>
<p>Think back to the first and second examples:</p>
<pre class=" language-javascript"><code class="prism  language-javascript"><span class="token keyword">const</span> <span class="token function-variable function">add</span> <span class="token operator">=</span> <span class="token punctuation">(</span>x<span class="token punctuation">,</span> y<span class="token punctuation">)</span> <span class="token operator">=&gt;</span> x <span class="token operator">+</span> y<span class="token punctuation">;</span>
<span class="token keyword">const</span> <span class="token function-variable function">add_c</span> <span class="token operator">=</span> x <span class="token operator">=&gt;</span> y <span class="token operator">=&gt;</span> x <span class="token operator">+</span> y<span class="token punctuation">;</span>
</code></pre>
<p>In JavaScript we manually curried the <code>add</code> function, but in Haskell all functions are curried automatically so there’s no need to differentiate between them, and because this is built into the language, application of the functions is the same whether they are accepting one or more parameters.</p>
</div>
</body>

</html>
