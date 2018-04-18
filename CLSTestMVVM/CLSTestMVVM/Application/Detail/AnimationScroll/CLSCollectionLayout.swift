 //
 import UIKit
 
 final class CLSCollectionLayout: UICollectionViewLayout {
    
    // Standard height for expanding cells.
    private var expandHeight: CGFloat = 0.0
    
    // Standard height for collapse cells.
    private var collapsedHeight: CGFloat = 0.0
    
    // Drag Offset is the amount the user needs to scroll before the featured cell changes.
    private var dragOffset: CGFloat = 0.0
    
    public init(expandHeight: CGFloat, collapsedHeight: CGFloat) {
        super.init()
        self.expandHeight = expandHeight
        self.collapsedHeight = collapsedHeight
        self.dragOffset = expandHeight / 2
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal var cached = [UICollectionViewLayoutAttributes]()
    
    // Return the size of all the content in the collection view
    override var collectionViewContentSize: CGSize {
        let contentHeight = CGFloat(numberOfItems) * dragOffset + (height - dragOffset)
        print("collectionViewContentSize = \(contentHeight)")
        return CGSize(width: width, height: contentHeight)
    }
    
    // Return true so that the layout is continuously invalidated as the user scrolls
    override  func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // Return the content offset of the nearest cell which achieves the nice snapping effect,
    // similar to a paged UIScrollView
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                      withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let proposedItemIndex = round(proposedContentOffset.y / dragOffset)
        let nearestPageOffset = proposedItemIndex * dragOffset
        // Smooth scrolling when user release the touch to focoused cell
        print("targetContentOffset")
        return CGPoint(x: 0, y: nearestPageOffset)
    }
    
    // Return all attributes in the cache whose frame intersects with the rect passed to the method
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cached.filter { attributes in
            return attributes.frame.intersects(rect)
        }
    }
    
    // Perform whatever calculations are needed to determine the position of the cells and views in the layout
    override func prepare() {
        cached = [UICollectionViewLayoutAttributes]()
        // last rect will be used to calculate frames past the first one.  We initialize it to a non junk 0 value
        var frame = CGRect()
        var y: CGFloat = 0
        for item in 0..<numberOfItems {
            let indexPath = IndexPath(item: item, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            // Important because each cell has to slide over the top of the previous one
            attributes.zIndex = item
            // Initially set the height of the cell to the collapsed height
            var height = collapsedHeight
            ///
            if indexPath.item == currentExpandedItemIndex {
                // The expand cell
                y = yOffset - collapsedHeight * nextItemPercentageOffset
                height = expandHeight
            } else if indexPath.item == (currentExpandedItemIndex + 1) && indexPath.item != numberOfItems {
                // The cell directly below the expanded cell, which grows as the user scrolls
                let maxY = y + collapsedHeight
                height = collapsedHeight + max((expandHeight - collapsedHeight) * nextItemPercentageOffset, 0)
                y = maxY - height
            } else {
                // Other cells
                y = frame.origin.y + frame.size.height
            }
            frame = CGRect(x: 0, y: y, width: width, height: height)
            attributes.frame = frame
            cached.append(attributes)
            y = frame.maxY
        }
        print("cached = \(cached.first?.frame.minY)")

    }
    
    // Returns the layout attributes for the item at the specified index path.
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cached[indexPath.item]
    }
 }
 
private extension CLSCollectionLayout {
    
    var numberOfItems: Int {
        return collectionView?.numberOfItems(inSection: 0) ?? 0
    }
    
    var width: CGFloat {
        return collectionView?.frame.width ?? 0
    }
    
    var height: CGFloat {
        return collectionView?.frame.height ?? 0
    }
    
    var yOffset: CGFloat {
        return collectionView?.contentOffset.y ?? 0
    }
 }
 
 private extension CLSCollectionLayout {
    
    // Returns the item index of the currently featured cell
    var currentExpandedItemIndex: Int {
        return max(0, Int(yOffset / dragOffset))
    }
    
    // Returns a value between 0 and 1 that represents how close the next cell is to becoming the expanding cell
    var nextItemPercentageOffset: CGFloat {
        return (yOffset / dragOffset) - CGFloat(currentExpandedItemIndex)
    }
 }
 
 

