<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inventory Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --dark-bg: #0c0c0d;
            --card-bg: #21212a;
            --border-color: #2a2a2a;
            --accent-purple: #7e3ff2;
            --success-green: #2dd36f;
            --danger-red: #eb445a;
            --text-light: #f8f9fa;
            --text-secondary: #adb5bd;
        }
        body {
            background: var(--dark-bg);
            color: var(--text-light);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .header {
            padding: 15px 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: bold;
            font-size: 1.5rem;
            border-bottom: 1px solid var(--border-color);
            background-color: var(--card-bg);
            margin-bottom: 20px;
        }
        .customer-table {
            background-color: var(--card-bg);
            border-radius: 15px;
            overflow: hidden;
            border: 1px solid var(--border-color);
            margin-top: 40px;
        }
        .table {
            color: var(--text-light);
            margin-bottom: 0;
        }
        .table th {
            border-bottom: 1px solid var(--border-color);
            font-weight: 500;
            color: var(--text-secondary);
            padding: 15px;
            background: var(--card-bg);
        }
        .table td {
            padding: 15px;
            border-bottom: 1px solid var(--border-color);
            vertical-align: middle;
        }
        .table tr:last-child td {
            border-bottom: none;
        }
        .btn-update {
            background-color: var(--success-green);
            color: white;
            border: none;
            border-radius: 4px;
            padding: 5px 12px;
            margin-right: 8px;
            transition: background 0.2s;
        }
        .btn-update:hover {
            background-color: #26b862;
            color: white;
        }
        .btn-delete {
            background-color: var(--danger-red);
            color: white;
            border: none;
            border-radius: 4px;
            padding: 5px 12px;
            transition: background 0.2s;
        }
        .btn-delete:hover {
            background-color: #d63c50;
            color: white;
        }
        .btn-add {
            background-color: var(--accent-purple);
            color: white;
            border: none;
            border-radius: 4px;
            padding: 7px 18px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 6px;
            transition: background 0.2s;
        }
        .btn-add:hover {
            background-color: #6a34d1;
            color: white;
        }
        .search-box {
            background-color: rgba(255,255,255,0.05);
            border: 1px solid var(--border-color);
            border-radius: 50px;
            padding: 8px 15px;
            color: var(--text-light);
        }
        .search-box:focus {
            background-color: rgba(255,255,255,0.1);
            color: var(--text-light);
            box-shadow: none;
            border-color: var(--accent-purple);
        }
        .search-box::placeholder {
            color: var(--text-secondary);
        }
        .dropdown-menu {
            background-color: var(--card-bg);
            border: 1px solid var(--border-color);
        }
        .dropdown-item {
            color: var(--text-light);
        }
        .dropdown-item:hover {
            background-color: rgba(255,255,255,0.05);
            color: var(--text-light);
        }
        .pagination {
            margin-top: 20px;
        }
        .page-link {
            background-color: var(--card-bg);
            border-color: var(--border-color);
            color: var(--text-light);
            margin: 0 3px;
            border-radius: 5px;
        }
        .page-link:hover {
            background-color: var(--accent-purple);
            color: white;
            border-color: var(--accent-purple);
        }
        .page-item.active .page-link {
            background-color: var(--accent-purple);
            border-color: var(--accent-purple);
        }
        .text-muted {
            color: var(--text-secondary)!important;
        }
    </style>
</head>
<body>
<div class="header">
   <i class="bi bi-hexagon-fill"></i>
    Dashboard <span class="text-secondary ms-1">v.01</span>
</div>

<div class="container my-5">
    <div class="customer-table p-3">
        <div class="d-flex flex-wrap justify-content-between align-items-center mb-4">
            <a href="<%= request.getContextPath() %>/inventory/InventoryInsertForm.jsp " class="btn btn-add mb-2">
                <i class="bi bi-plus-circle"></i> Add Item
            </a>
            <div class="d-flex align-items-center gap-2 mb-2">
                <input type="text" name="tableSearch" class="form-control search-box" style="width:200px;" placeholder="Search"
                       value="${param.tableSearch}">
                <div class="dropdown">
                    <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button"
                            id="sortDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        Sort by: <c:out value="${param.sort != null ? param.sort : 'Newest'}"/>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="sortDropdown">
                        <li><a class="dropdown-item" href="InventoryGetAllServlet?sort=Newest">Newest</a></li>
                        <li><a class="dropdown-item" href="InventoryGetAllServlet?sort=Oldest">Oldest</a></li>
                        <li><a class="dropdown-item" href="InventoryGetAllServlet?sort=Name">Name</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table align-middle">
                <thead>
                <tr>
                    <th>Inventory ID</th>
                    <th>Inventory Name</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Supplier Name</th>
                    <th>Last Restock Date</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="inventory" items="${inventoryList}">
                    <tr>
                        <td>${inventory.inventoryId}</td>
                        <td>${inventory.invantoryName}</td>
                        <td>${inventory.invantoryDescription}</td>
                        <td>${inventory.quantityAvailable}</td>
                        <td>${inventory.supplierName}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty inventory.lastRestockDate}">
                                    <fmt:formatDate value="${inventory.lastRestockDate}" pattern="yyyy-MM-dd"/>
                                </c:when>
                                <c:otherwise>
                                    N/A
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <button class="btn btn-update me-2" onclick="window.location.href='InventoryUpdateServlet?inventoryid=${inventory.inventoryId}'">
                                <i class="bi bi-pencil-square"></i> Update
                            </button>
                            <button class="btn btn-delete" onclick="confirmDelete(${inventory.inventoryId})">
                                <i class="bi bi-trash"></i> Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty inventoryList}">
                    <tr>
                        <td colspan="7" class="text-center">No inventory items found</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-between align-items-center mt-3 flex-wrap">
            <div class="text-muted small mb-2">
                Showing ${startIndex + 1} to ${endIndex} of ${totalRecords} entries
            </div>
            <nav>
                <ul class="pagination mb-0">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="BookGetAll?page=${currentPage - 1}&sort=${param.sort}&tableSearch=${param.tableSearch}">&laquo;</a>
                    </li>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="BookGetAll?page=${i}&sort=${param.sort}&tableSearch=${param.tableSearch}">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="BookGetAll?page=${currentPage + 1}&sort=${param.sort}&tableSearch=${param.tableSearch}">&raquo;</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<script>
    function confirmDelete(id) {
        if (confirm("Are you sure you want to delete this inventory item?")) {
            window.location.href = 'InventoryDeleteServlet?inventoryid=' + id;
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
