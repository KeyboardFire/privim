-- Tests for :[count]close! and :[count]hide

local helpers = require('test.functional.helpers')(after_each)
local feed, eval, eq, clear, execute =
  helpers.feed, helpers.eval, helpers.eq, helpers.clear, helpers.execute

describe('close_count', function()
  setup(clear)

  it('is working', function()
    execute('let tests = []')
    execute('for i in range(5)')
    execute('new')
    execute('endfor')
    execute('4wincmd w')
    execute('close!')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({6, 5, 4, 2, 1}, eval('buffers'))
    execute('1close!')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({5, 4, 2, 1}, eval('buffers'))
    execute('$close!')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({5, 4, 2}, eval('buffers'))
    execute('1wincmd w')
    execute('2close!')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({5, 2}, eval('buffers'))
    execute('1wincmd w')
    execute('new')
    execute('new')
    execute('2wincmd w')
    execute('-1close!')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({7, 5, 2}, eval('buffers'))
    execute('2wincmd w')
    execute('+1close!')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({7, 5}, eval('buffers'))
    execute('only!')
    execute('b1')
    execute('let tests = []')
    execute('for i in range(5)')
    execute('new')
    execute('endfor')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({13, 12, 11, 10, 9, 1}, eval('buffers'))
    execute('4wincmd w')
    execute('.hide')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({13, 12, 11, 9, 1}, eval('buffers'))
    execute('1hide')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({12, 11, 9, 1}, eval('buffers'))
    execute('$hide')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({12, 11, 9}, eval('buffers'))
    execute('1wincmd w')
    execute('2hide')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({12, 9}, eval('buffers'))
    execute('1wincmd w')
    execute('new')
    execute('new')
    execute('3wincmd w')
    execute('-hide')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({15, 12, 9}, eval('buffers'))
    execute('2wincmd w')
    execute('+hide')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({15, 12}, eval('buffers'))
    execute('only!')
    execute('b1')
    execute('let tests = []')
    execute('set hidden')
    execute('for i in range(5)')
    execute('new')
    execute('endfor')
    execute('1wincmd w')
    execute('$ hide')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({20, 19, 18, 17, 16}, eval('buffers'))
    execute('$-1 close!')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({20, 19, 18, 16}, eval('buffers'))
    execute('1wincmd w')
    execute('.+close!')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({20, 18, 16}, eval('buffers'))
    execute('only!')
    execute('b1')
    execute('let tests = []')
    execute('set hidden')
    execute('for i in range(5)')
    execute('new')
    execute('endfor')
    execute('4wincmd w')
    feed('<C-W>c<cr>')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({25, 24, 23, 21, 1}, eval('buffers'))
    feed('1<C-W>c<cr>')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({24, 23, 21, 1}, eval('buffers'))
    feed('9<C-W>c<cr>')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({24, 23, 21}, eval('buffers'))
    execute('1wincmd w')
    feed('2<C-W>c<cr>')
    execute('let buffers = []')
    execute('windo call add(buffers, bufnr("%"))')
    eq({24, 21}, eval('buffers'))
  end)
end)
