import UIKit



class Solution {
    
    /// 542 01矩阵
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        //bfs
        var res = Array.init(repeating: Array.init(repeating: -1, count: matrix[0].count), count: matrix.count)
        var q: [(x: Int, y: Int)] = []
        for section in 0..<matrix.count {
            for row in 0..<matrix[section].count {
                if matrix[section][row] == 0 {
                    q.append((x: section, y: row))
                    res[section][row] = 0
                }
            }
        }
        let edges = [(x: -1, y: 0), (x: 0, y: -1), (x: 1, y: 0), (x: 0, y: 1)]
        while !q.isEmpty {
            let cur = q.removeFirst()
            for t in edges {
                let (x, y) = (cur.x + t.x, cur.y + t.y)
                if x >= 0, x < matrix.count, y >= 0, y < matrix[0].count, res[x][y] == -1 {
                    res[x][y] = res[cur.x][cur.y] + 1
                    q.append((x: x, y: y))
                }
            }
        }
        
        return res
    }
    
    
    
    //#1162. 地图分析
    func maxDistance(_ grid: [[Int]]) -> Int {
        var max = -1
        let n = grid.count
        var res = Array.init(repeating: Array.init(repeating: -1, count: n), count: n)
        var p : [(x: Int, y: Int)] = []
        for i in 0..<n {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    p.append((x: i, y: j))
                    res[i][j] = 0
                }
            }
        }
        if p.count == n * n {
            return max
        }
        
        let edges = [(x: -1, y: 0), (x: 0, y: -1), (x: 1, y: 0), (x: 0, y: 1)]
        while !p.isEmpty {
            let cur = p.removeFirst()
            for t in edges {
                let (x, y) = (cur.x + t.x, cur.y + t.y)
                if x >= 0, x < n, y >= 0, y < n, res[x][y] == -1 {
                    let m = Swift.max(res[cur.x][cur.y], 0)
                    res[x][y] = m + 1
                    p.append((x: x, y: y))
                    max = Swift.max(max, res[x][y])
                }

            }
        }
        return max
    }
    
    
    /// 200. 岛屿数量
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var p: [(x: Int, y: Int)] = []
        var count = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == "1" {
                    grid[i][j] = "0"
                    p.append((x: i, y: j))
                    while !p.isEmpty {
                        let edges = [(x: -1, y: 0), (x: 0, y: -1), (x: 1, y: 0), (x: 0, y: 1)]
                        let cur = p.removeFirst()

                        for t in edges {
                            let (x, y) = (cur.x + t.x, cur.y + t.y)
                            if x >= 0, x < grid.count, y >= 0, y < grid[0].count, grid[x][y] == "1" {
                                grid[x][y] = "0"
                                p.append((x: x, y: y))
                            }
                        }
                    }
                    print("debug2 \(count)")
                    count += 1
                }
            }
        }
        return count
    }
}

let s = Solution()
//print(s.updateMatrix([[0,0,0],
//                      [0,1,0],
//                      [1,1,1]]))
//print(s.updateMatrix([[0,0,0], [0,1,0], [0,0,0]]))
//print(s.maxDistance([[1,0,1],
//                     [0,0,0],
//                     [1,0,1]]))
//print(s.maxDistance([[1,0,0],
//                     [0,0,0],
//                     [0,0,0]]))

print(s.numIslands([
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
  ]))

print(s.numIslands([
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
  ]))
